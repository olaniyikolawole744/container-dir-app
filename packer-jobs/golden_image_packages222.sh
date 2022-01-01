#!/bin/bash

#INSTALL PACKER
echo "installing packer....."
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer

#INSTALL TERRAFORM
echo "installing terraform....."
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform -y

#INSTALLING DOCKER
echo "installing docker....."
sudo amazon-linux-extras install docker -y
#sudo service docker start

