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
  region  = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.server_ami.id
  instance_type = "t2.micro"
  key_name = "new-devops-key"
  tags = {
    Name = "HelloWorld"
  }
}