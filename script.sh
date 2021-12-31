#!/bin/bash
echo "installing softwares....................................................................."
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum -y install packer
yum -y install terraform
amazon-linux-extras install ansible2 -y
yum -y git
python -m ensurepip --upgrade
pip install boto
ansible --version
git --version
python --version
pip --version
pip show boto

echo "initializing configuration files........................................................"
packer init packer/golden_image_ami222.pkr.hcl
terraform -chdir=terraform-jobs/infrastructure_vpc/ init
terraform -chdir=terraform-jobs/remote_servers/ init
terraform -chdir=terraform-jobs/subnet_rt_assoc/ init
terraform -chdir=terraform-jobs/tools_server/ init

echo "creating infrasctructure................................................................"
packer build packer/golden_image_ami222.pkr.hcl && \
terraform -chdir=terraform-jobs/infrastructure_vpc/ apply --auto-approve && \
terraform -chdir=terraform-jobs/tools_server/ apply -var-file=variable_values.tfvars --auto-approve && \
terraform -chdir=terraform-jobs/remote_servers/ apply -var-file=variable_values.tfvars --auto-approve && \
terraform -chdir=terraform-jobs/subnet_rt_assoc/ apply --auto-approve

echo "run ansible playbook....................................................................."
chmod 755 ansible-jobs/inventory/hosts/ec2.py
ANSIBLE_HOSTS=ansible-jobs/inventory/ec2.py
EC2_INI_PATH=ansible-jobs/inventory/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --vault-password-file ansible-jobs/playbook/dockerhub_credentials ansible-jobs/playbook/playdev.yml -i ansible-jobs/inventory/hosts/ec2.py


