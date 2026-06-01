all:
	docker compose -f srcs/docker-compose.yml up -d --build --no-recreate 
# -d --build --no-recreate ?
#
build-%:
	docker compose up --build -d $*

$(TERM) -e sh -c "docker exec -it $*"