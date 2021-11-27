#!/bin/bash
ls
cd terraform-jobs
cd remote_servers
terraform init
terraform apply "-var-file=infrastructure_values.tfvars" --auto-approve

cd ..
cd subnet_rt_assoc
terraform init
terraform apply --auto-approve