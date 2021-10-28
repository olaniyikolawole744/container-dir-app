#!/bin/bash

# CREATE VPC
cd ..
cd terraform-jobs || exit 
cd vpc || exit 
terraform init
terraform apply --auto-approve

# CREATE TOOL SERVER
cd ..
cd tools_server || exit
terraform init
terraform apply "-var-file=variable_values.tfvars" --auto-approve

# ASSOCIATING ROUTING TABLE
cd ..
cd subnet_rt_assoc || exit
terraform init
terraform apply --auto-approve