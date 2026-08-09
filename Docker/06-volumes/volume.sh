#!/bin/sh

##############################################
##########  PART 1 - NAMED VOLUMES ###########
##############################################

#list all docker volumes
 docker volume ls

#Create "named" docker volume and then list to confirm it has been created
 docker volume create myvol
 docker volume ls

 #View meta-data of named volume. 
 # Question: Is the Moutpoint displayed in output a real directory on host that will store the container data files?
 docker volume inspect myvol

# Create/run a docker container based on busybox image 
# INFO: busybox is like swiss army knife for Linux - very small in size.
docker run -it --name busybee --rm -v myvol:/data busybox:latest sh

# Now you are inside the containers "sh" shell, type following linux commands
# to create a file in /data folder which you mapped (via myvol:/data)
touch /data/mydata.dat
exit

# Now your back on your host (since you "exit"ed container) and also the container has been destroyed
# due to "--rm" option. Execute to be extra sure, it does not show up
docker ps -a

# Create/run another new docker container based on busybox image 
# and execute command to list the files in container directory /data
docker run -it --name busybee2 --rm -v myvol:/data busybox:latest ls -l /data

# Question: What do you see? Is what you see as expected?
# Question: Does the container still exist after executing the above command? Explain your findings.

# Challenge:
# You have made sure that all busybox containers have been terminated. 
# You need to ensure the data from the containers has not been lost.
# Where is the data? Specifally the mydata.dat file?
# Hint: You already executed a docker command to get you the answer, above.


# Delete the named volume
docker volume remove myvol


#######################################################
##########  PART 2 - MULTIPLE NAMED VOLUMES ###########
#######################################################

# Create 3 different named volumes
docker volume create vol1
docker volume create vol2
docker volume create vol3

# list them all
docker volume ls

# Attach all 3 named volumes to different directories inside docker container filesystem
docker run -it --name multi-vol \
  --rm \
  -v vol1:/app/data \
  -v vol2:/app/logs \
  -v vol3:/app/config \
  busybox sh

# Challenge:
# a) Create 3 different files in each one of the 3 mapped directories inside the container
# b)exit container.
# c) Re-create a new 2nd container (same command) and confirm the files you created from a) are still there

# Remove all 3 named volumes
docker volume rm vol1 vol2 vol3


#######################################################
#############  PART 3 - Anonymous VOLUMES #############
#######################################################

# Create anonymous voluem with random name (not good for maintenance)
# Question: How is the mapping differnt here for the volume?
docker container run --it --name anonymousvoldemo  -v /data busybox:latest

# Crate a data file in anonymous volume which is mapped to /data dir in container file system.
touch /data/mydata.txt
exit

# Now your back on the host. Confirm anonymous volume was created.
# You should see a "local" volume with an anonymous name (i.e: a115401007f6af242019d8e7cfdf9bc0d2ab446a7bd2c7a4b607544b8f964626)
docker volume ls

# Challenge:
# Confirm that the file "/data/mydata.txt" was saved in the anonymous volume


#######################################################
##########  PART 4 - Bind host mount VOLUMES ##########
#######################################################

# Share the files in your home directory with the container
docker run --name bindhostdemo -it --rm -v /home/ec2-user:/data busybox:latest sh

#In the container, execute commands to confirm files from hosts home dir are there
cd /data
ls

# Question: What would happen if you removed one of the file in /dat in container?
# Would this remove the file on your host?
# Hint: DO NOT DO iI!! Yes, it will. It is shared (not a copy), its the actuall files from your
# host machione so bne careful.

# exit the container
exit

# cleanup all containers and any left over volumes
docker rm -f anonymousvoldemo
docker volume rm $YOUR_LOCAL_VOL_NAME_DPECIFC_TO_YOU
