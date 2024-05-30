CONTAINER_NAME ?= bahia_jobs-demo-web-1

up:
	@docker compose up

down:
	@docker compose down

s:
	@docker exec -it $(CONTAINER_NAME) \
	sh -c "/bin/bash || /bin/sh"
