#!/bin/sh

sudo mkdir -p /usr/libexec/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o /usr/libexec/docker/cli-plugins/docker-compose
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose

docker compose version

PLUGIN_DIR="/usr/libexec/docker/cli-plugins"
sudo mkdir -p "$PLUGIN_DIR"

ARCH=$(uname -m)
echo "Detected architecture: $ARCH"

if [[ "$ARCH" == "x86_64" ]]; then
  BUILDX_URL="https://github.com/docker/buildx/releases/download/v0.17.0/buildx-v0.17.0.linux-amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
  BUILDX_URL="https://github.com/docker/buildx/releases/download/v0.17.0/buildx-v0.17.0.linux-arm64"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

echo "=== Installing Docker Buildx ==="
sudo curl -fSL "$BUILDX_URL" -o "$PLUGIN_DIR/docker-buildx"
sudo chmod +x "$PLUGIN_DIR/docker-buildx"

sudo systemctl restart docker

echo "=== Verifying installation ==="
docker version
docker compose version
docker buildx version
