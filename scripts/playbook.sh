#!/bin/bash
cd ansible-jobs
ls
chmod 755 inventory/hosts/ec2.py
chmod 755 inventory/hosts/ec2.ini
echo "'${VAULT_CREDS_PSW}' > secret.txt"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playprod.yml -i inventory/hosts/ec2.py --vault-password-file secret.txt -e '@configs/dockerhub_credentials' -vvvvv