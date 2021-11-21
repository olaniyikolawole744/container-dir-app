#!/bin/bash

# CREATE VPC
cd ..
ls
cd terraform-jobs
cd vpc
terraform init
terraform apply --auto-approve

# CREATE TOOL SERVER
cd ..
cd tools_server
terraform init
terraform apply "-var-file=variable_values.tfvars" --auto-approve