#!/bin/bash
cd terraform-jobs
cd remote_servers
ls
terraform init
terraform apply "-var-file=variable_values.tfvars" --auto-approve

cd ..
cd subnet_rt_assoc
ls
terraform init
terraform apply "-var-file=variable_values.tfvars" --auto-approve