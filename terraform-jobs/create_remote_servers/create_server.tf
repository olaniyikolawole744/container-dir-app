terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

module "servers" {
  count = length(var.server_name_list)
  source = "../modules/ec2"

  server_amis                = var.ami_values[count.index]
  instance_type              = var.instance_type
  key_name                   = var.key_name
  server_name                = var.server_name_list[count.index]
  server_role                = var.server_role
  server_environment         = var.server_environment
  from_port                  = var.from_port
  to_port                    = var.to_port
  from_port2                 = var.from_port2[count.index]
  to_port2                   = var.to_port2[count.index]
  protocol                   = var.protocol
  public_subnet_cidr_block   = var.public_subnet_cidr_block[count.index]
  availability_zone_marker   = var.availability_zone_marker[count.index]
  backend_key                = var.backend_key[count.index]
  name_list_index            = count.index
}

