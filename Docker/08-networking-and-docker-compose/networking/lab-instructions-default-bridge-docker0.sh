
docker network ls


docker network inspect bridge


ip a

#Create 2 containers and see they are attached to the default bridge network
#and if they can talk to eachother

docker run -d --rm --name web-server nginx
#now see 1 veth pair
ip a

#start 2nd container
docker run -d \
  --name db \
  -e MYSQL_ROOT_PASSWORD=secret123 \
  -e MYSQL_DATABASE=testdb \
  -p 3306:3306 \
  mysql

#now see 2 veth pair
ip a


# can see container ip addresses
docker inspect db web-server | grep -i ipaddress

#see if both container connected to bridge
docker network inspect bridge

docker exec -it web-server sh
#apt-get update && apt-get install -y iputils-ping
#BUT cannot ping other container because using default bridge network...no DNS by container name, only IP!
#ping 172.17.0.3
#exit container 

docker exec -it db sh
# microdnf install iputils iproute
# ping 172.17.0.2
#exit container 


#cleanup