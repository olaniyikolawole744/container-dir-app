#!/bin/bash
yum install unzip -y
yum install wget -y
wget https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_amd64.zip
unzip terraform_0.14.9_linux_amd64.zip
mv terraform /usr/local/bin/
terraform --version
wget https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip
unzip packer_1.7.0_linux_amd64.zip
mv packer /usr/local/bin/
packer --version
amazon-linux-extras install ansible2 -y
ansible --version
python -m ensurepip --upgrade
pip install boto
echo "creating Packer AMI........................................................"
packer init packer-jobs/golden_image_ami222.pkr.hcl && \
packer build packer-jobs/golden_image_ami222.pkr.hcl

echo "creating vpc.............................."
terraform -chdir=terraform-jobs/infrastructure_vpc/ init && \
terraform -chdir=terraform-jobs/infrastructure_vpc/ apply --auto-approve

echo "creating tool server................................."
terraform -chdir=terraform-jobs/tools_server/ init && \
terraform -chdir=terraform-jobs/tools_server/ apply -var-file=variable_values.tfvars --auto-approve

echo "creating remote servers...................."
terraform -chdir=terraform-jobs/remote_servers/ init && \
terraform -chdir=terraform-jobs/remote_servers/ apply -var-file=variable_values.tfvars --auto-approve

echo "associating subnet with route table..................."
terraform -chdir=terraform-jobs/subnet_rt_assoc/ init && \
terraform -chdir=terraform-jobs/subnet_rt_assoc/ apply --auto-approve

echo "run ansible playbook....................................................................."
chmod 755 ansible-jobs/inventory/hosts/ec2.py
ANSIBLE_HOSTS=ansible-jobs/inventory/ec2.py
EC2_INI_PATH=ansible-jobs/inventory/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --vault-password-file ansible-jobs/playbook/dockerhub_credentials ansible-jobs/playbook/playdev.yml -i ansible-jobs/inventory/hosts/ec2.py







