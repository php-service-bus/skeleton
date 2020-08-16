CREATE TABLE IF NOT EXISTS scheduler_registry
(
    id              uuid PRIMARY KEY,
    processing_date timestamp NOT NULL,
    command         bytea     NOT NULL,
    is_sent         bool      NOT NULL
);

CREATE TABLE IF NOT EXISTS sagas_store
(
    id               UUID,
    identifier_class VARCHAR   NOT NULL,
    saga_class       VARCHAR   NOT NULL,
    payload          BYTEA     NOT NULL,
    state_id         VARCHAR   NOT NULL,
    created_at       TIMESTAMP NOT NULL,
    expiration_date  TIMESTAMP NOT NULL,
    closed_at        TIMESTAMP,
    CONSTRAINT saga_identifier PRIMARY KEY (id, identifier_class)
);

CREATE INDEX IF NOT EXISTS sagas_state ON sagas_store (state_id);
CREATE INDEX IF NOT EXISTS saga_closed_index ON sagas_store (state_id, closed_at);

CREATE TABLE IF NOT EXISTS event_store_stream
(
    id               uuid PRIMARY KEY,
    identifier_class varchar   NOT NULL,
    aggregate_class  varchar   NOT NULL,
    created_at       timestamp NOT NULL,
    closed_at        timestamp
);

CREATE TABLE IF NOT EXISTS event_store_stream_events
(
    id          uuid PRIMARY KEY,
    stream_id   uuid,
    playhead    int       NOT NULL,
    event_class varchar   NOT NULL,
    payload     bytea     NOT NULL,
    occured_at  timestamp NOT NULL,
    recorded_at timestamp NOT NULL,
    canceled_at timestamp,
    CONSTRAINT event_store_stream_fk FOREIGN KEY (stream_id) REFERENCES event_store_stream (id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX IF NOT EXISTS event_store_stream_identifier ON event_store_stream (id, identifier_class);
CREATE UNIQUE INDEX IF NOT EXISTS event_store_stream_events_playhead ON event_store_stream_events (stream_id, playhead) WHERE canceled_at IS NULL;
CREATE INDEX IF NOT EXISTS event_store_stream_events_stream ON event_store_stream_events (id, stream_id);

CREATE TABLE IF NOT EXISTS event_sourcing_indexes
(
    index_tag  varchar NOT NULL,
    value_key  varchar NOT NULL,
    value_data varchar NOT NULL,
    CONSTRAINT event_sourcing_indexes_pk PRIMARY KEY (index_tag, value_key)
);

CREATE TABLE IF NOT EXISTS event_store_snapshots
(
    id                 uuid PRIMARY KEY,
    aggregate_id_class varchar   NOT NULL,
    aggregate_class    varchar   NOT NULL,
    version            int       NOT NULL,
    payload            bytea     NOT NULL,
    created_at         timestamp NOT NULL,
    CONSTRAINT event_store_snapshots_fk FOREIGN KEY (id) REFERENCES event_store_stream (id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX IF NOT EXISTS event_store_snapshots_aggregate ON event_store_snapshots (id, aggregate_id_class);
CREATE UNIQUE INDEX IF NOT EXISTS event_store_snapshots_identifier ON event_store_snapshots (id, aggregate_id_class);
