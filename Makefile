include .env

run:
	@make build
	./dating-apps-api

build:
	@go build -v -o dating-apps-api ./cmd/main.go

migrate-up:
	@migrate -database ${DB_MIGRATION_CONNECTION} -path database/migrations up

migrate-down:
	@migrate -database ${DB_MIGRATION_CONNECTION} -path database/migrations down

migration:
	@migrate create -ext sql -dir database/migrations/ $(filename)