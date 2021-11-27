#!/bin/bash

# CREATE TOOL SERVER
cd ..
cd terraform-jobs
cd tools_server
terraform init
terraform apply "-var-file=variable_values.tfvars" --auto-approve