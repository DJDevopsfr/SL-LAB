#!/bin/bash
set -e

INVENTORY="inventory.ini"
CONFIG_SRC="./my_custom_mariadb.cnf"   # Path to your local config file
CONFIG_DEST="/etc/my.cnf.d/custom.cnf" # Destination on EC2
DB_GROUP="db_servers"

echo "[INFO] Downloading MySQL RPM release package..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m shell -a "wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm -O /tmp/mysql80-community-release-el9-1.noarch.rpm"

echo "[INFO] Installing MySQL RPM to enable repository..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m dnf -a "name=/tmp/mysql80-community-release-el9-1.noarch.rpm state=present disable_gpg_check=yes"

echo "[INFO] Importing MySQL GPG key..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m shell -a "rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023"

echo "[INFO] Installing MySQL client..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m dnf -a "name=mysql-community-client state=present"

echo "[INFO] Installing MySQL server..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m dnf -a "name=mysql-community-server state=present"

echo "[INFO] Copying custom MariaDB configuration..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m copy -a "src=$CONFIG_SRC dest=$CONFIG_DEST owner=root group=root mode=0644"

echo "[INFO] Restarting MariaDB service to apply new configuration..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m systemd -a "name=mysqld state=restarted"

echo "[INFO] Checking MySQL version..."
ansible -i "$INVENTORY" "$DB_GROUP" -b -m command -a "mysql --version"

echo "[INFO] Checking MariaDB/MySQL port 3306 listening..."

# Check if MariaDB port is listening (3306 by default)
# ss command in Linux is a utility to inspect sockets — it shows which ports and network connections are being used on 
# your system. It’s similar to the older netstat, but faster and more powerful
#-t → show TCP sockets
#-l → show only listening sockets
#-n → show numeric addresses/ports instead of resolving names
ansible -i inventory.ini db_servers -b -m shell -a "ss -tln | grep 3306"

echo "[SUCCESS] MySQL/MariaDB installation, config, and verification complete!"
