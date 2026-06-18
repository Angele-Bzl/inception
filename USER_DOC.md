# Introduction
In this documentation, we consider that you already read the DEV_DOC.md file and that the environment is already set and good to go.    
If not, please refer to the dev documentation first.    

# Understand what services are provided by the stack
The stack provides 3 services :
- Mariadb
- Wordpress
- NGINX

## Mariadb
Mariadb is a database managment system forked from MySQL    
It allows to store data that will be in a DB volume of the Docker.  
It is the first service built in the docker-compose.yml file, as other services depends on it.  

## Wordpress
Worpdress is a web content managment system. It will work here using php-fpm.   
Here this service will allow you to have an already made website with sample pages and user management. 

## NGINX
NGINX is web server and reverse proxy. It is the bridge between the internet and your website.  

# Start and stop the project
To start the project, you can up all the services with this command :
```
make up
```
To end it you can type this command :
```
make down
```
If you don't want to down all the services, networks, volumes and image but just want to stop the running service, you can use this command "
```
make stop
```
and at any time you can start it back :
```
make start
```
**Note** : `stop` and `start` are way lighter and faster than `up` and `down`. But you can't `start` the project if you didn't `up` it.

# Access the website and the administration panel
To access the website, go to your browser and type this url : `https://abarzila.42.fr`. 
To connect, go to the page `https://abarzila.42.fr/wp-admin` and enter your admin id and password. You will access the administration panel.

# Locate and manage credentials
After following the dev documentation, there should be an `.env` file in the `srcs/` directory. This is where there is all the credentials needed for the architecture to work. 
**Note** : Make sure your admin id for wordpress doesn't contain 'admin' or 'Admin', as it will be refused because a security breach.   

# Check that the services are running correctly
At anytime in your terminal you can check what servicec are running and their status by typing in the repo root directory `make info`.
