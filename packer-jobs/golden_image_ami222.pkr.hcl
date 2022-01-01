#variable "access_key" {
 # type      = string
  #default   = "${env("AWS_ACCESS_KEY")}"
  #sensitive = true
#}

#variable "secret_key" {
 # type      = string
  #default   = "${env("AWS_SECRET_ACCESS_KEY")}"
  #sensitive = true
#}

#variable "region" {
 # type      = string
  #default   = "us-east-1"
  #sensitive = true
#}

source "amazon-ebs" "golden_image_ami222" {
  tags = {
    Name = "golden_image_ami222"
  }
  #access_key    = "${var.access_key}"  ### blank out for docker
  #secret_key    = "${var.secret_key}"  ### blank our for docker
  #region        = "${var.region}"
  ssh_username  = "ec2-user"
  ami_name      = "golden_image_ami222"
  #source_ami    = "ami-04902260ca3d33422"  
  source_ami    =  "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
}

build {
  sources = ["source.amazon-ebs.golden_image_ami222"]

  provisioner "shell" {
    script = "packer-jobs/create_user_and_ssh_key.sh"
  }

  provisioner "shell" {
    script = "packer-jobs/golden_image_dependencies.sh"
  }

  provisioner "shell" {
    script = "packer-jobs/golden_image_packages222.sh"
  }

  #provisioner "shell" {
   # script = "environment_variables.sh"
  #}
}

