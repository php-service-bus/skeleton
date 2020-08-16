help:
	@echo "Run: make <target> where <target> is one of the following:"
	@echo "  reset		        Reset all data"
	@echo "  start		        Run supporting application containers"
	@echo "  consumer-logs		Display consumer logs"
	@echo "  consumer-restart	Display consumer logs"
	@echo "  migrations-make    Make migrations file"
	@echo "  migrations-up      Execute migrations"
	@echo "  migrations-down    Rollback migrations"
	@echo "  ping               Execute test command"

reset:
	@docker-compose -f docker-compose.yml down --volumes

start:
	@docker-compose -f docker-compose.yml up --build -d

consumer-logs:
	@docker logs service-bus-skeletone-consumer -f

consumer-restart:
	@docker restart service-bus-skeletone-consumer
	@docker logs service-bus-skeletone-consumer -f

migrations-make:
	tools/migrations/make

migrations-up:
	@docker exec -it service-bus-skeletone-consumer /var/www/tools/migrations/migrate up

migrations-down:
	@docker exec -it service-bus-skeletone-consumer /var/www/tools/migrations/migrate down

ping:
	@docker exec -it service-bus-skeletone-consumer /var/www/tools/ping