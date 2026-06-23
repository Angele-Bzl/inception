SRCS = srcs/
YML = docker-compose.yml
FILE = -f $(SRCS)$(YML)

.PHONY: help
help:
	@echo "--- TARGET GUIDE ---"
	@echo "make help: display the target guide"
	@echo "make up: create the containers and volumes"
	@echo "make down: end and destroy the containers"
	@echo "make stop: stop the containers without destroying them"
	@echo "make start: start the containers if they were stopped"
	@echo "make info: prints the containers and the volumes running"
	@echo "make logs-<service>: prints the docker-compose logs of the service"
	@echo "make fclean: down the containers, destroy the volumes and images" 
	@echo "make re: destroy and remake the containers"
	@echo "--- END OF TARGET GUIDE ---"

.PHONY: up
up:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose $(FILE) up -d --build --no-recreate

.PHONY: down
down:
	docker compose $(FILE) down 

.PHONY: stop
stop:
	docker compose $(FILE) stop 

.PHONY: start
start:
	docker compose $(FILE) start

.PHONY: info
info:
	docker compose $(FILE) ps -a
	docker volume ls

.PHONY:logs
logs-%:
	docker logs $*


.PHONY: fclean
fclean: down
	docker system prune -af
	docker image prune -af
	docker volume rm wordpress || true
	docker volume rm mariadb || true
	sudo rm -rf ~/data/wordpress/* ~/data/mariadb/*

.PHONY: re
re: down up

.PHONY: fre
fre: fclean up
