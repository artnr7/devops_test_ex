.PHONY: upb up down test

upb:
	docker compose up -d --build

up:
	docker compose up -d

down:
	docker compose down

test:
	curl http://localhost
