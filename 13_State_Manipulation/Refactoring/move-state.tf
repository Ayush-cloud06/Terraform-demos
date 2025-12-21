/*
1. Terraform state mv <source> <destination>

*/
locals {
  ec2_names = ["instance1", "instance2"]
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
moved {
  from = aws_instance.default
  to   = aws_instance.new
}

moved {
  from = aws_instance.new_list
  to   = aws_instance.new_list2
}
resource "aws_instance" "new_list2" {
  //at first was aws_instance.default -> aws_instance.new
  //label new -> new_list
  ami           = data.aws_ami.ubuntu.id // terraform state mv aws_instance.default aws_instance.new
  instance_type = "t2.micro"             // Now the state is moved to aws_instance.new
  for_each      = toset(local.ec2_names)
}
/*
terraform state mv \
  'aws_instance.new_list["instance1"]' \
  'aws_instance.new_list2["instance1"]'

terraform state mv \
  'aws_instance.new_list["instance2"]' \
  'aws_instance.new_list2["instance2"]' */

