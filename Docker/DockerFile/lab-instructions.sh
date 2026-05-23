#!/bin/sh

# Your mission is to customize the index.html file with your name and updated app version # and include it in a custom nginx build

# Insert docker command to build and tag your images
docker ?????

# Confirm you images is listed
docker images

# Run your custom nginx container
docker container run --rm -d -p 80:80 $YOUR_IMAGE_NAME:$YOUR_OPTIONAL_TAG

# Test via web page that you see you custom index.html mesasge 

# Tag your image with the name of your DockerHub repo
docker tag  $YOUR_IMAGE_NAME:$YOUR_OPTIONAL_TAG  $YOUR_REPO_NAME/$YOUR_IMAGE_NAME:$YOUR_OPTIONAL_TAG

# Push it to your repo
docker push ?????

# Share it with class in chat (I will test it works on my machine)
