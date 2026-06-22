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
Make sure you have docker installed on your host machine. You might need to do a command that look like this :
```
sudo apt install docker
```
Then git clone this project.    
```
git clone git@github.com:Angele-Bzl/inception.git <new directory>
```
In your new directory/srcs/requirements you will find a file called `.env_example_to_fill`. You can rename it `.env` and complete each variable with a value.  
**Note** : your admin user name can't contain `admin` or `Admin`.

# Build and launch the project using the Makefile and Docker compose
To launch the containers, go at the root of your directory (where there is the Makefile) and type the up command :
```
make up
```
This target will launch the containers and network, create the volumes, and start the docker. Your website is now reachable.    
If you have any questions, type `make` or `make help` to see all the possible targets.

# Use relevant commands to manage the containers and volumes
Every relevant commands is now a target from the Makefile. Typing `make help` will show you this target guide : 
```
	--- TARGET GUIDE ---
	make help: display the target guide
	make up: create the containers and volumes
	make down: end and destroy the containers
	make stop: stop the containers without destroying them
	make start: start the containers if they were stopped
	make info: prints the containers and the volumes running
	make logs-<service>: prints the docker-compose logs of the service
	make fclean: down the containers, destroy the volumes and images 
	make re: destroy and remake the containers
	--- END OF TARGET GUIDE ---
```

# Identify where the project data is stored and how it persists
There are two volumes in this docker compose :
```
/home/abarzila/data/wordpress
```
```
/home/abarzila/data/mariadb
```
The volumes are stored on the host machine, thus not destroyed when the containers are down.