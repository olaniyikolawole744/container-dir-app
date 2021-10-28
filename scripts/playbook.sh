#!/bin/bash
cd ansible-jobs
ls
chmod 755 inventory/hosts/ec2.py
chmod 755 inventory/hosts/ec2.ini

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playprod.yml -i inventory/hosts/ec2.py --vault-password-file $ANSIBLE_VAULT_PASSWORD_FILE -e '@configs/dockerhub_credentials' -vvvvv