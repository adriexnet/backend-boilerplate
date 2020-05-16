include utils/meta.mk utils/help.mk

clear-local-db: ##@local Remove the local db container, image and volume
clear-local-db:
	@docker-compose down -v && rm -Rf db_data

run-local-db: ##@local Launch your local database postgres server
run-local-db:
	@docker-compose up -d postgres

run: ##@local Run the project locally
run:
	@$(SHELL_EXPORT) [ -f .env ] && source .env || echo "$(YELLOW)WARNING:$(RESET) .env file not found"
	@$(SHELL_EXPORT) docker-compose up -d --build postgres
	@$(SHELL_EXPORT) docker-compose up -d --build wallet
	@until \
		docker-compose exec postgres pg_isready; \
		do echo "$(BLUE)INFO$(RESET) waiting for postgres service"; \
		sleep 5; done;
	@$(SHELL_EXPORT) docker-compose up -d --build hasura
	@until \
		curl http://localhost:8085/v1/version; \
		do echo "$(BLUE)INFO$(RESET) waiting for hasura service"; \
		sleep 5; done;
	@$(SHELL_EXPORT) docker-compose up -d --build hapi
	@cd hasura; \
		hasura console --endpoint http://localhost:8085 --no-browser 

stop: ##@local Stops the development instance
stop:
	@docker-compose stop

install: ##@local Install hapi dependencies
install:
	@cd hapi && yarn

pre-commit: ##@local Run pre commit validations for hapi
pre-commit:
	@[ ! -d hapi/node_modules ] && cd hapi && yarn || echo ""
	@cd hapi && yarn format && yarn lint

launch-console: ##@local Launch hasura console pointing at local server
launch-console:
	@cd hasura; \
		hasura console --endpoint http://localhost:8085

generate-seed: ##@local Generates a seed dump file with data available on public schema
generate-seed:
	@$(SHELL_EXPORT) [ -f .env ] && source .env || echo "$(YELLOW)WARNING:$(RESET) .env file not found"
	@docker-compose exec \
		postgres pg_dump \
		--schema public \
		--data-only \
		$(DATABASE_URL) \
		| grep -v -E 'search_path'

restore-seed: ##@local Takes a given seed and restores it to the db
restore-seed:
	@$(SHELL_EXPORT) [ -f .env ] && source .env || echo "$(YELLOW)WARNING:$(RESET) .env file not found"
	@docker-compose exec \
		-T \
		postgres psql \
		$(DATABASE_URL)
