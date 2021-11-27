#!/bin/bash

# CREATE VPC
ls
cd terraform-jobs
cd infrastructure_vpc
terraform init
terraform apply --auto-approve