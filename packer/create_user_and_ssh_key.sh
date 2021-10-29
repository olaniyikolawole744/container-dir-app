#!/bin/bash
ssh-keygen -t rsa -C "olaniyikolawole744@gmail.com" -f /tmp/tf-packer

sudo useradd -m -s /bin/bash jenkins
sudo usermod -a -G wheel jenkins
sudo cp /etc/sudoers /etc/sudoers.orig
echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins

# Installing SSH key
sudo mkdir -p /home/jenkins/.ssh
sudo chmod 700 /home/jenkins/.ssh
sudo cp /tmp/tf-packer /home/jenkins/.ssh/id_rsa
sudo chmod 600 /home/jenkins/.ssh/id_rsa
sudo cp /tmp/tf-packer.pub /home/jenkins/.ssh/id_rsa.pub
sudo cp /tmp/tf-packer.pub /home/jenkins/.ssh/authorized_keys
sudo chmod 600 /home/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /home/jenkins/.ssh
sudo usermod --shell /bin/bash jenkins