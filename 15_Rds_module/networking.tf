data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "RDS custom"
  }
}

resource "aws_subnet" "allowed" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "not_allowed" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.24.0.0/16"
}
