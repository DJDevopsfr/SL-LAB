#/bin/sh

#ansible -i inventory.ini  multi --list-hosts
ansible-playbook -i inventory.ini playbook.yaml
