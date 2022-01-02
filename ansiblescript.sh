#!/bin/bash
echo "run ansible playbook....................................................................."
chmod 755 ansible-jobs/inventory/hosts/ec2.py
ANSIBLE_HOSTS=ansible-jobs/inventory/ec2.py
EC2_INI_PATH=ansible-jobs/inventory/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --vault-password-file ansible-jobs/playbook/dockerhub_credentials ansible-jobs/playbook/playdev.yml -i ansible-jobs/inventory/hosts/ec2.py
