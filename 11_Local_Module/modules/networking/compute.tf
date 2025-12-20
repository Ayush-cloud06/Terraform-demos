locals {
  project_name = "11-local-module-compute"
}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id = module.networking.public_subnets["subnet_2"].subnet_id

  tags = {
    Name = local.project_name
  }
}


resource "aws_instance" "this_2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id = module.networking.public_subnets["subnet_3"].subnet_id

  tags = {
    Name = "${local.project_name}-2"
  }
}
