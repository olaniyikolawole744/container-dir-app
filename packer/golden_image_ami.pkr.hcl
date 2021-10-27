variable "access_key" {
  type      = string
  default   = "${env("AWS_ACCESS_KEY")}"
  sensitive = true
}

variable "secret_key" {
  type      = string
  default   = "${env("AWS_SECRET_ACCESS_KEY")}"
  sensitive = true
}

variable "region" {
  type      = string
  default   = "us-east-1"
  sensitive = true
}

source "amazon-ebs" "golden_image_ami" {
  tags = {
    Name = "golden_image_ami"
  }
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  region        = "${var.region}"
  ssh_username  = "ec2-user"
  ami_name      = "golden_image_ami"
  source_ami    = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
}

build {
  sources = ["source.amazon-ebs.golden_image_ami"]

  provisioner "shell" {
    script = "user.sh"
  }

  provisioner "shell" {
    script = "golden_image_dependencies.sh"
  }

  provisioner "shell" {
    script = "golden_image_packages.sh"
  }

  provisioner "shell" {
    script = "environment_variables.sh"
  }
}

