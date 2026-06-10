PHONY: all
all:
	docker compose -f srcs/docker-compose.yml up -d --build --no-recreate 
# -d --build --no-recreate ?

# PHONY: build
# build-%:
# 	docker compose up --build -d $*

$(TERM) -e sh -c "docker exec -it $*"

PHONY: down
down:
	docker compose down -f srcs/docker-compose.yml

PHONY: stop
stop:
	docker compose stop -f srcs/docker-compose.yml

PHONY: start
start:
	docker compose start -f srcs/docker-compose.yml

PHONY: info
info:
	docker compose ps -a srcs/docker-compose.yml
	docker volume ls -f srcs/docker-compose.yml

PHONY:logs
logs-%:
	docker logs $* -f srcs/docker-compose.yml

PHONY: destroy
destroy:
	down
	docker system prune -af
	docker image prune -af
	sudo rm -rf ~/data/wordpress/* ~/data/mariadb/*

PHONY: redo
redo:
	destroy
	all

PHONY: help
help:
	echo "\
	[default]: create the containers and volumes\n
	down: end and destroy the containers\n
	stop: stop the containers without destroying them\n
	start: start the containers if they were stopped\n
	info: prints the containers and the volumes running\n
	logs-<service>: prints the docker-compose logs of the service\n
	destroy: down the containers, destroy the volumes and images\n 
	redo: destroy and remake the containers\
	"

