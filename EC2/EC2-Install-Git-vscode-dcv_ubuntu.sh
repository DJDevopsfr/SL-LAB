#!/bin/bash -xe

# Update system
apt-get update -y
apt-get upgrade -y

# Install basic tools and Git
apt-get install -y wget gpg apt-transport-https software-properties-common git

# Verify Git installation
git --version

# Install Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/packages.microsoft.gpg

# Add VS Code repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list

# Install VS Code
apt-get update -y
apt-get install -y code

# Verify VS Code installation
code --version || echo "VS Code installed"

# Restart NICE DCV server
systemctl restart dcvserver || true

# Create DCV session for ubuntu user
dcv create-session mysession --owner ubuntu || true

# List DCV sessions
dcv list-sessions || true