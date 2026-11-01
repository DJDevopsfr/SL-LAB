#/bin/sh

ansible -i inventory.ini multi -a "hostname"
ansible -i inventory.yml app_servers -m command -a "df -h"

# by default using command module
ansible -i inventory.yml db_servers -b -m file -a "path=/tmp/foo_ansible state=touch mode=0644"

ansible -i inventory.yml db_servers  -a "ls -l /tmp/foo_ansible"

# Shows you tons of info on targets, very verbose (setup module) thus add a filter
ansible -i inventory.yml db_servers  -m setup -a filter=ansible_architecture

#point to this machine (group: ansible_contoller define in .ini)
ansible -i inventory.ini ansible_contoller -a "git --version"
