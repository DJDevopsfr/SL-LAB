#!/bin/bash

# Exit the script immediately if any command fails
set -e

# Trace execution
set -x

# Determine the target user.
# If $USER is empty or root, default to 'ubuntu'.
TARGET_USER="$USER"

if [ -z "$TARGET_USER" ] || [ "$TARGET_USER" = "root" ]; then
    echo "Current user is empty or root. Defaulting to ubuntu since script is for Ubuntu."
    TARGET_USER="ubuntu"
fi

echo "Updating packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Installing required packages..."
sudo apt-get install -y \
    docker.io \
    git \
    bash-completion \
    curl

echo "Starting and enabling Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding user ($TARGET_USER) to the docker group..."
sudo usermod -aG docker "$TARGET_USER"

echo "Setting up Docker CLI auto-completion..."
DOCKER_COMPLETION_FILE="/etc/bash_completion.d/docker"

if [ ! -f "$DOCKER_COMPLETION_FILE" ]; then
    echo "Downloading Docker bash completion script..."
    sudo curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker -o "$DOCKER_COMPLETION_FILE"
fi

echo "Reloading bash completion..."
source /etc/bash_completion || true
source "$DOCKER_COMPLETION_FILE" || true

echo "All done!"
echo "You may need to log out and log back in for docker group changes to take effect."
echo "Test Docker with: docker version"
echo "Ensure you are the $TARGET_USER user when executing docker commands."