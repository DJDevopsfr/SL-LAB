#/bin/sh

ansible-playbook -i inventory.yml playbook-apache-intall.yml

# can select a specific to start at within playbook if 1 step is failing and want to just re-execute that 1 step.
# ansible-playbook -i inventory.yml playbook-apache-intall.yml  -start-at-task "Test Apache response on default port 80"

