#!/bin/sh

# -p 8080:8080 --> Jenkins web UI
# -p 50000:50000 --> For Jenkins agents to connect
" -v creates a named volume named jenkins_home"
docker run -d \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v "$PWD":/workspace \
  jenkins/jenkins:lts-jdk17

  #If EC" SG port 8080 is open then can even go see in web page at 

  #Get default admin passsord
  docker logs jenkins

# Copy that password and visit:
http://localhost:8080

# Can now run you jobs in console or download Jenkins cli 
# and automate your pipeline execution (need the XML file that describes your pipeline) via cli or scripts but outside scope of example
# docker exec -it jenkins curl -o /workspace/jenkins-cli.jar http://localhost:8080/jnlpJars/jenkins-cli.jar

docker stop jenkins

#cleanup
docker rm jenkins
docker volume rm jenkins_home

docker ps -a
docker volume ls