#/bin/sh

ansible -i inventory.ini app_servers -b -m group -a "name=appadmin state=present"

ansible -i inventory.ini app_servers -b -m user -a " \
name=appadmin1 \
group=appadmin \
state=present \
shell=/bin/bash \
create_home=yes \
comment=added_by_ansible" \
--check      # this is check mode which does not actually perform the actual but rather tells you would happen if you did execute it


# Remove user
#ansible -i inventory.ini app_servers -b -m user -a "name=appadmin1 state=absent remove=yes"
