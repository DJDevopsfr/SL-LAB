#!/bin/sh

#Ensure we can reach registered hosts in inventory file:wq

ansible all --list-hosts -i inventory.ini
ansible all -m ping -i inventory.ini
