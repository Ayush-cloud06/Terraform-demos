
locals {
  allowed_instance_types = ["t2.micro", "t2.small", "t2.medium"]
}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "this" {
  ami = data.aws_ami.ubuntu.id
  //subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = true
  instance_type               = var.instance_type


  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  lifecycle {
    create_before_destroy = true
    precondition {
      condition     = contains(local.allowed_instance_types, var.instance_type)
      error_message = "The instance type"
    }

    postcondition {
      condition     = contains(local.allowed_instance_types, self.instance_type)
      error_message = "The instance type ${self.instance_type} is not allowed."
    }
  }

}
