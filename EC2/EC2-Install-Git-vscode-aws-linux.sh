#!/bin/bash -xe

# Update system
dnf update -y

# Install Git
dnf install -y git

# Verify Git installation
git --version

# Import Microsoft GPG key
rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add VS Code repository
cat <<EOF > /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

# Install VS Code
dnf install -y code

# Verify VS Code installation
code --version || echo "VS Code installed"