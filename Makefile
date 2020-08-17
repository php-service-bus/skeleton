help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Run: make <target> where <target> is one of the following'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

reset: ## Reset all data
	@docker-compose -f docker-compose.yml down --volumes

start: ## Run supporting application containers
	@docker-compose -f docker-compose.yml up --build -d

consumer-logs:
	@docker logs service-bus-skeletone-consumer -f

consumer-restart: ## Display consumer logs
	@docker restart service-bus-skeletone-consumer
	@docker logs service-bus-skeletone-consumer -f

migrations-make: ## Make migrations file
	tools/migrations/make

migrations-up: ## Execute migrations
	@docker exec -it service-bus-skeletone-consumer /var/www/tools/migrations/migrate up

migrations-down: ## Rollback migrations
	@docker exec -it service-bus-skeletone-consumer /var/www/tools/migrations/migrate down

ping: ## Execute test command
	@docker exec -it service-bus-skeletone-consumer /var/www/tools/ping

.DEFAULT_GOAL := help