#!/bin/bash
set -e

# stream output
export PYTHONUNBUFFERED=1
# show ANSI-colored output
export ANSIBLE_FORCE_COLOR=true

# set this to either a host or a group from the inventory
if [[ -z "${TARGET_HOSTS}" ]]; then
	echo "TARGET_HOSTS not set!"
	exit 1
fi

ansible-playbook \
	-i inventory.yaml \
	-i ../../../private/environments/dev/ansible/inventory.yaml \
	./playbook.yml \
	--extra-vars "variable_host=$TARGET_HOSTS" \
	--ask-become-pass
