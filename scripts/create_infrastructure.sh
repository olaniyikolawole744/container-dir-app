#!/bin/bash
cd terraform-jobs
cd remote_servers
ls
docker-compose -f docker-compose.yml run --rm terraform init
docker-compose -f docker-compose.yml run --rm terraform apply "-var-file=variable_values.tfvars" --auto-approve

cd ..
cd subnet_rt_assoc
ls
docker-compose -f docker-compose.yml run --rm terraform init
docker-compose -f docker-compose.yml run --rm terraform apply "-var-file=variable_values.tfvars" --auto-approve