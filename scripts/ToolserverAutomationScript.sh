#!/bin/bash
cd ..
cd terraform-jobs
cd tools_server
ls
docker-compose -f docker-compose.yml run --rm terraform apply "-var-file=variable_values.tfvars" --auto-approve