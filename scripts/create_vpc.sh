#!/bin/bash

# CREATE VPC
cd terraform-jobs
cd infrastructure_vpc
ls
sudo docker-compose -f docker-compose.yml run --rm terraform init
sudo docker-compose -f docker-compose.yml run --rm terraform apply --auto-approve