#!/bin/bash

echo "Installing Requirements..."
pipenv install

echo "Installing roles..."
ROLES_PATH=/var/tmp/ansible-sanaei/roles
pipenv run ansible-galaxy install --roles-path $ROLES_PATH -r role-requirement.yml

echo "Running ansible..."
ANSIBLE_CONFIG="ansible.cfg"
ANSIBLE_INVENTORY="inventories/"
ANSIBLE_MAIN_PLAYBOOK="playbooks/main.yml"
pipenv run ansible-playbook -i $ANSIBLE_INVENTORY $ANSIBLE_MAIN_PLAYBOOK --diff "${@:1}"
