postgres:
	docker run --name postgres14.1 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:14.1-alpine

createdb:
	docker exec -it postgres14.1 createdb --username=root --owner=root simplebank

dropdb:
	docker exec -it postgres14.1 dropdb simplebank

migrateup:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simplebank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc