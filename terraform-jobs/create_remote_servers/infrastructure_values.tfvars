# EC2 INSTANCE ARGUMENT VALUES
ami_values                  = ["golden_image_ami222","golden_image_ami222"]
instance_type               = "t2.micro"
key_name                    = "new-devops-key"
server_name_list                 = ["dev","prod"]
server_role                        = "dir_app"
server_environment                 = "prod"
name_list_index             = ""
server_name                        = ""
server_amis                 = ""

# SECURITY GROUP ARGUMENT VALUES
from_port = "22"
to_port   = "22"

from_port2 = ["8080","8080"]
to_port2 = ["8080","8080"]

protocol  = "tcp"

# SUBNET ARGUMENT VALUES
public_subnet_cidr_block = ["50.0.20.0/24","50.0.30.0/24"]
availability_zone_marker   = ["b","c"]

# BACKEND ARGUMENT VALUE
backend_key = ["dir-app/dev/terraform.tfstate","dir-app/prod/terraform.tfstate"]

# AWS ARGUMENT VALUE
region = "us-east-1"