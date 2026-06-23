# Set up the environment from scratch (prerequisites, configuration files, secrets)
Make sure you have docker installed on your host machine. You might need to do a command that look like this :
```
sudo apt install docker
```
Then git clone this project.    
```
git clone git@github.com:Angele-Bzl/inception.git <new directory>
```
In your new directory/srcs you will find a file called `.env_example_to_fill`. You can rename it `.env` and complete each variable with a value.  
**Note** : your admin user name can't contain `admin` or `Admin`, and your email must be a valid email string.

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
If you want to manually type the docker compose commands, go in the srcs/ directory (where the docker-compose.yml file is).	

# Identify where the project data is stored and how it persists
There are two volumes in this docker compose :
```
/home/abarzila/data/wordpress
```
```
/home/abarzila/data/mariadb
```
The volumes are stored on the host machine, thus not destroyed when the containers are down.    

When the containers are up, you can access the database like so :
1) go inside the mariadb container
```
docker exec -it mariadb sh
```
2) access the database with mysql
```
mysql -u <user> [-p] -D <your_db>
```
3) You can now find the data you want. Here are examples.
```
SHOW TABLES;
SELECT * FROM wp_users;
```