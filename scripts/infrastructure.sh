#!/bin/bash
cd terraform-jobs
cd create_servers
ls
terraform init
terraform apply "-var-file=infrastructure_values.tfvars" --auto-approve

cd ..
cd subnet_rt_assoc
ls
terraform init
terraform apply --auto-approve