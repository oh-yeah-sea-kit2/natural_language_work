
run:
	docker-compose up -d --build

exec:
	docker-compose exec python3 bash

ps:
	docker-compose ps

down:
	docker-compose down
