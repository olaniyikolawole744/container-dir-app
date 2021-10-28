#!/bin/bash
ls
echo "creating infrastructure ........................................"
cd terraform-jobs || exit
cd create_remote_servers || exit
terraform init
terraform apply "-var-file=infrastructure_values.tfvars" --auto-approve

cd ..
cd subnet_rt_assoc || exit
terraform init
terraform apply --auto-approve