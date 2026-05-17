#!/bin/sh

# Pull Docker images for different Python versions
docker pull python:3.12-slim
docker pull python:3.11-slim
docker pull python:3.10-slim
docker pull python:3.9-slim

# Run the Python script in each Docker container with different versions and then remove all containers
# volume bind mount the .py code from $PWD directory and mount in container /tmp
#Then run the code from /tmp in container

docker run --rm -v "$PWD":/tmp -w /tmp python:3.12-slim python python_code_to_test.py
docker run --rm -v "$PWD":/tmp -w /tmp python:3.11-slim python python_code_to_test.py
docker run --rm -v "$PWD":/tmp -w /tmp python:3.10-slim python python_code_to_test.py
docker run --rm -v "$PWD":/tmp -w /tmp python:3.9-slim python python_code_to_test.py

docker rmi $(docker images -a -q --filter reference="python:*")