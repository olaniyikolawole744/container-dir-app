#!/bin/bash
cd ..
cd ansible-jobs
ls
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playprod.yml -i inventory/hosts/ec2.py -vvvvv