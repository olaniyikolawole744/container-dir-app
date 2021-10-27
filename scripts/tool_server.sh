#!/bin/bash
# CREATE VPC
cd ..
cd terraform-jobs
cd vpc
ls
terraform init
terraform apply --auto-approve

# CREATE TOOL SERVER
cd ..
ls
cd tools_server
terraform init
terraform apply --auto-approve