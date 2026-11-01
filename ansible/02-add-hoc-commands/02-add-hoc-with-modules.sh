#/bin/sh

# Install chrony daemon on all servers to keep the time in sync using ansible's dnf module
# to do the same as "dnf install -y chrony"
# The -b option (alias for --become) tells Ansible to run the command with
# become (basically, run commands with ‘sudo’)
# state=present : Package must be installed (if not, install it)
# other values for state: 
# absent:	Package must be removed
# latest:	Package must be installed and upgraded to the latest available version
# reinstalled: Reinstall the package even if already present

ansible -i inventory.ini multi -b -m dnf -a "name=chrony state=present"

# Should see that changed = false
# in ouput because chrony already installed on amazon linux 2023, thus indempotent (no change)

ansible -i inventory.ini multi -b -m dnf -a "name=git state=present"

# if installing git for fist time then will see in yellow (changed)...
# change=true with the results shown
# run again and will see that it is green and changed = false


# command and shell module.
# shell command can do piping and redirection whereas command module cannot
# command safer 
ansible -i inventory.ini multi -m shell -a "git --version > /tmp/foo"
ansible -i inventory.ini multi -m command -a "chronyd --version"



#Now we’ll make sure the chrony daemon is started and set to run on boot. We
#could use two separate commands, systemctl start chronyd and systemctl enable
#chronyd, but we’ll use Ansible’s service module instead.
ansible -i inventory.ini  multi -b -m service -a "name=chronyd state=started enabled=yes"


#The last thing we should do is check to make sure our servers are synced closely to
#the official time on a time server:
ansible -i inventory.ini multi -b -a "chronyc tracking"
