*This project has been created as part of the 42 curriculum by abarzila*

# Project Inception

## Description
Inception is a 42 school a system administration related project to make our first steps in the world of docker networks. 
We had to virtualize three docker images and connect them to one another in order to have a functionnal Wordpress website, with a mariaDB data base, via an nginx server proxy.

### Elements of the project

```mermaid

---
config:
  theme: 'forest'
---
flowchart LR

    WWW@{ shape: circle, label: "WWW" } <-->|443| NGINX(container nginx)
    subgraph Computer host
        subgraph Docker network
            NGINX <-->|9000| WordPress(container WordPress)
            WordPress <--> |3306| mariadb(container MariaDB)
        end
            WordPress <--> WPDB
        subgraph Volumes
          NGINX <--> WPDB@{ shape: cyl, label: "Wordpress" }
          mariadb <--> MDB@{ shape: cyl, label: "DB" }
        end
    end

    
```

### Project description
#### Virtual machines VS docker
Virtual machines and docker do look alike, as they both simulate an environment. But they are inherently different. 
Virtual machines (VM) are virtual environment that access the kernel through the hypervisor, when container access directly to the kernel.  
Most of the times, a VM will have an OS, it will simulate a CPU, the RAM, and everything in a machine, making the images heavy, easly many BG.  
In the case of the container, it only contains an app with no OS, only the bare minimum with no interface whatsoever. Also in a network, the containers optimize by loading the libraries once for everyone. A container image is usually weighted in MB.
In a nutshell, containers are optimized and lighter VM, with no intermediate to the kernel. The biggest con is that it is a younger technology (Docker is from 2013) which can have security or system breachs. 

##### Container or docker ?
Docker is a platform displaying containers and helping build images architectures.  
Each container contain an isolated app, and docker automate its deployment and, if needed, creates a special network architecture.  
The main function of container is to solve the compatibilty problems that can occur when an app runs from one machine to another. By building an app in a isolated environment, you then only have to give the environment with the app to make sure it works.
Also by being isolated, the containers have less chance of being corrupted by the host. 

#### Secrets VS Environment variables

#### Docker network VS host network
docker-compose crée automatiquement un network quand on up (pk ?)
A container is the instance of a docker image.
To build the container, we used a dockerfile telling which base image we need, and how we wanted to customize it (what app, what script at the launch...) 
The docker-compose.yml file allow to build multiple docker at a time, and create communications in the network.

#### Docker volumes VS bind mounts
a volume maps the docker directory to a directory on our machine, so that if the container is closed or crashes, the data still exists on the host.


## Instructions
Git clone this project onto your computer host. You will need to have sudo, since some makefile targets use `rm -rf` commands.  
Add to your cloned directory a `.env` file. You will need all the variables given in the `.env_exemple_to_fill.txt` file.
Go in your cloned directory, then to build your docker network and wordpress website, do `make up`. To down your containers, you can do `make down`. At any time you can do `make` or `make help` to see all the available targets.

```
git clone <this project> <directory-name>
cd <directory-name>
touch .env
<fill your .env file>
make up
make down //when you are finished
```
That's it ! You now have a running Wordpress page ! If you want to know more about it, you can go to the `DEV_DOC.md` file, or `USER_DOC.md` file, depending on your needs.

## Use of AI
In this project, I used AI when I had an unexpected behavior in my code, not knowing the origin, especially when they were no visible error or fail.  
Very quickly, the use of AI became counterproductive as it doesn't really 'think' as a whole. Asking help to my school mates turned out way more effective.

## Project diagram
### Structure of the project
```mermaid
```
### Flowchart of the program
```mermaid
``` 

## Resources
- [make a yml file](https://github.com/Tutors42Lyon/Github-Actions)
- [make a dockerfile](https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/)
- [VM VS container](https://www.youtube.com/watch?v=aN4PCILrbBg)
- [what is docker](https://www.youtube.com/watch?v=mspEJzb8LC4)
- [what is docker](https://fr.wikipedia.org/wiki/Docker_(logiciel))
- [write a docker-compose.yml](https://www.youtube.com/watch?v=DM65_JyGxCo)
- [understanding Inception step by step](https://tuto.grademe.fr/inception/)
- [debian's versions](https://www.debian.org/releases/index.fr.html)
- [connecting MariaDB to a server](https://mariadb.com/docs/server/server-usage/connecting/mariadb-connecting-guide-1)
- [what is nginx](https://www.f5.com/glossary/nginx)
- [docker compose documentation](https://docs.docker.com/reference/compose-file/)
- [explore database](https://www.softwaretestinghelp.com/use-mysql-from-command-line/)
- [What is php-fpm](https://www.plesk.com/blog/guides/php-fpm-the-future-of-php-handling/)
- [What is PID 1 and how to do a proper init ](https://denibertovic.com/posts/containers-and-signal-handling-why-you-need-to-care-about-pid-1/)