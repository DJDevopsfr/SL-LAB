#/bin/sh


# When you omit -m, Ansible defaults to the command module.
# -a is the arguements to the command module
ansible -i inventory.yml ec2_targets -a "free -h" -u ec2-user

