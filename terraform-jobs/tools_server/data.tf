data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["golden_image_ami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}
