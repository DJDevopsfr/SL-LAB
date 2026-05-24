#!/bin/bash -xe

# Update system
dnf update -y

# Install Git
dnf install -y git

# Verify Git installation
git --version