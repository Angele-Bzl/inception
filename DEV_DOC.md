docker compose up [--build]
docker compose down [-v]
docker compose stop
docker compose start
docker compose ps -a
docker volume ls
docker exec -it <service> sh
docker logs <service>
docker system prune -a [-f]
docker image prune -a [-f]


docker exec -it mariadb sh
mysql -u <user> [-p] -D <your_db>
SHOW TABLES;
SELECT * FROM wp_users;

# Set up the environment from scratch (prerequisites, configuration files, secrets)
# Build and launch the project using the Makefile and Docker compose
# Use relevant commands to manage the containers and volumes
# Identify where the project data is stored and how it persists