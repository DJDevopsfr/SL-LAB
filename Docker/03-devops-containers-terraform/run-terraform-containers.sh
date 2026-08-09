#!/bin/sh

# DevOps Container - Terraform

#Create a container container with a name and remove it after it has finished
# Lets run a container with Terraform!!
# My Terraform templates for aws vpc templates and config are in this directory so lets share them with terraform server
# the "-it" is just to see the output when terraform will "init" but then it will exit the container
#you see the .terraform* files in your host now because of volume bind mount

docker run --rm -it \
  -v "$PWD":/workspace \
  -w /workspace \
  hashicorp/terraform:latest init

#Deploy the vpc!
  docker run --rm -it \
  -v "$PWD":/workspace \
  -w /workspace \
  hashicorp/terraform:latest apply -auto-approve

#Clean up
 docker run --rm -it \
  -v "$PWD":/workspace \
  -w /workspace \
  hashicorp/terraform:latest destroy -auto-approve