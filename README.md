*This project has been created as part of the 42 curriculum by abarzila*

# Project Inception

## Description
### Elements of the project

```mermaid

---
config:
  theme: 'forest'
---
```

### Project description
#### Virtual machines VS docker
2 types of VM 
- type 1 access to the hypervisor that access the kernel (few perf loss) the hardware is a program
- type 2 access the OS of the vm, then the hypervisor, then the OS, then the kernel (what I use here)
Also micro VM exists (no OS, no systemD)
une image de VM -> plusieurs GB
2 types of containers
- app container
docker is a container runtime
kernel functianility of linux
it contains an app into a group. No OS, just the app i need so very light for the CPU and the RAM (because optimized, if many containers need the same library, it's only loaded one). There is no intermediate between the group and the kernel, no app, no hypervisor. Best perf. Cons : it's younger so more failles.
-> une image de container -> plusieurs MB
- system container
the container has the app AND an OS. so all the app of the OS are here (like crontab)
LXC is the runtime for those containers

en gros VM passe par un hyperviseur, alors que le contenair passe par le kernel direct

CONTAINER VS DOCKER
Docker c'est une plateforme qui contient des container -> stack technique
on met en place une architecture d'images
Résoud les soucis de compatibilité de versions
un container contient une appli isolée

le container c'est l'instance d'une image docker
le dockerfile permet de dire de quelle image de base on part, puis la customiser avec d'autres features, app, dont on a besoin

docker-compose.yml permet de faire en sorte que les dockers puissent communiquer entre eux (ce qui n'est pas censé etre possible)


#### Secrets VS Environment variables
#### Docker network VS host network
docker-compose crée automatiquement un network quand on up (pk ?)

#### Docker volumes VS bind mounts
a volume maps the docker directory to a directory on our machine, so that if the container is closed or crashes, the data still exists on the host.


## Instructions

## Use of AI

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