#/bin/sh

ansible -i inventory.ini ec2_targets --list-hosts

echo "Using ad-hoc command to ping servers in inventory.ini file"
# -vvvv should only be used for debugging (very verboce flag)
# ping is the module. It doesn’t actually ICMP ping — it just checks that Python is available and Ansible can run on the host.
ansible -i inventory.ini ec2_targets -m ping -u ec2-user # -vvvv
