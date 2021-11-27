#!/bin/bash

# CREATE VPC
ls
cd terraform-jobs
cd infrastructure_vpc
docker-compose -f docker-compose.yml run --rm terraform init
docker-compose -f docker-compose.yml run --rm terraform apply "-var-file=variable_values.tfvars" --auto-approve