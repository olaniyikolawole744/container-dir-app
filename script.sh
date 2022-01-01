#!/bin/bash
echo "installing yum util...................................................................."
#yum update -y

yum install -y yum-utils
yum -y install sudo
useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker


echo "installing yum config manager....................."
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
yum -y install packer
#yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
#yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

echo "installing packer......................."
#sudo yum -y install packer
#yum update -y
#yum install unzip -y 

#yum install wget -y 

#yum install vim -y

#wget https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip

#unzip packer_1.7.0_linux_amd64.zip

#mv packer /usr/local/bin/

echo "installing terraform...................."
sudo yum -y install terraform

#wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

#unzip terraform_0.11.11_linux_amd64.zip

#mv terraform /usr/local/bin/

echo "installing ansible...................."
amazon-linux-extras install ansible2 -y

echo "installing git......................"
/usr/bin/yum -y install git

echo "installing pip..................."
python -m ensurepip --upgrade

echo "installing boto................."
pip install boto

echo "confirming installations..................."
ansible --version

git --version

python --version

pip --version

pip show boto

terraform --version

packer --version

echo "creating Packer AMI........................................................"
/usr/bin/packer init packer/golden_image_ami222.pkr.hcl && \
/usr/bin/packer build packer/golden_image_ami222.pkr.hcl

echo "creating vpc.............................."
/usr/bin/terraform -chdir=terraform-jobs/infrastructure_vpc/ init && \
/usr/bin/terraform -chdir=terraform-jobs/infrastructure_vpc/ apply --auto-approve

echo "creating tool server................................."
/usr/bin/terraform -chdir=terraform-jobs/tools_server/ init && \
/usr/bin/terraform -chdir=terraform-jobs/tools_server/ apply -var-file=variable_values.tfvars --auto-approve

echo "creating remote servers...................."
/usr/bin/terraform -chdir=terraform-jobs/remote_servers/ init && \
/usr/bin/terraform -chdir=terraform-jobs/remote_servers/ apply -var-file=variable_values.tfvars --auto-approve

echo "associating subnet with route table..................."
/usr/bin/terraform -chdir=terraform-jobs/subnet_rt_assoc/ init && \
/usr/bin/terraform -chdir=terraform-jobs/subnet_rt_assoc/ apply --auto-approve


#echo "creating infrasctructure................................................................"
#packer build packer/golden_image_ami222.pkr.hcl && \
#terraform -chdir=terraform-jobs/infrastructure_vpc/ apply --auto-approve && \
#terraform -chdir=terraform-jobs/tools_server/ apply -var-file=variable_values.tfvars --auto-approve && \
#terraform -chdir=terraform-jobs/remote_servers/ apply -var-file=variable_values.tfvars --auto-approve && \
#terraform -chdir=terraform-jobs/subnet_rt_assoc/ apply --auto-approve

echo "run ansible playbook....................................................................."
chmod 755 ansible-jobs/inventory/hosts/ec2.py
ANSIBLE_HOSTS=ansible-jobs/inventory/ec2.py
EC2_INI_PATH=ansible-jobs/inventory/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --vault-password-file ansible-jobs/playbook/dockerhub_credentials ansible-jobs/playbook/playdev.yml -i ansible-jobs/inventory/hosts/ec2.py


