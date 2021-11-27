resource "aws_instance" "web" {

  ami = data.aws_ami.server_ami.id

  instance_type = var.instance_type

  associate_public_ip_address = true

  iam_instance_profile = data.aws_iam_instance_profile.master_server_iam_profile.name
  
  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.sg_template.id]

  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.server_name}_server"
    Role = var.server_role
    Environment = var.server_environment
  }
}