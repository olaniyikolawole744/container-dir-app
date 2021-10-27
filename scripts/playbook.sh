#!/bin/bash
cd ansible-jobs
ls
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ansible-jobs/playbook/playprod.yml -i ansible-jobs/inventory/hosts/ec2.py -vvvvv