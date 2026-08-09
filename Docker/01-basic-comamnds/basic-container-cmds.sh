#!/bin/sh

# Basic Container commands

# Runs in forground , CTRL + C to stop
# has no name
docker container run -p 80:80 nginx

# stopped, get name
docker ps -a 

docker container start modest_johnson 
docker container stop modest_johnson
docker container restart  modest_johnson
docker container pause  modest_johnson   #cannot exec -it, until you unfreeze
docker container unpause  modest_johnson

#execute some command in container
docker container exec  modest_johnson ls /
docker container exec  modest_johnson cat /etc/passwd

docker container exec -it modest_johnson /bin/bash
#exit

docker container rm -f modest_johnson  

####### GIVE IT A NAME   #######
docker container run --name n1 -d -p 80:80 nginx
docker ps
# Look at ENTRYPOINT, CMD, PORT
docker container inspect n1


docker container run --name java-playground -it openjdk:21-jdk-slim bash

#Create with a name and remove once done job
docker run --name java-playground --rm -it openjdk:21-jdk-slim java -version

#Go into container and play arounf in Java JShell
docker run --name java-playground --rm -it openjdk:21-jdk-slim bash
# Type "jshell"
# jshell> System.out.println("Hello Java");
# /exit
