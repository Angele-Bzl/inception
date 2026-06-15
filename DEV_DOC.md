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