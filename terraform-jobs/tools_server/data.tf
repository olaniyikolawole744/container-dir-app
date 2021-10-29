data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["golden_image_ami222"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}

data "template_file" "bootstrap_file" {
  template = file("${path.module}/${"bootstrap"}.txt")
}