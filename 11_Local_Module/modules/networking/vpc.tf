
locals {
  public_subnets = {
    for key, config in var.subnet_config : key => config if config.public
  }
}

data "aws_availability_zones" "available" {
  state = "available"

}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_config.cidr_block

  tags = {
    Name = var.vpc_config.name
  }
}
data "aws_region" "current" {}

resource "aws_subnet" "this" {
  for_each          = var.subnet_config
  vpc_id            = aws_vpc.this.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr_block

  tags = {
    Name = each.key
  }

  lifecycle {
    precondition {
      condition     = contains(data.aws_availability_zones.available.names, each.value.az)
      error_message = <<-EOT
      AZ: ${each.value.az} is not valid.  
      Subnet Key:${each.key}
      AWS Region:${data.aws_region.current.name} 
      Invalid AZ:${each.value.az} is not available in the current region.
        EOT
    }
  }
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  count  = length(local.public_subnets) > 0 ? 1 : 0

  tags = {
    Name = "${var.vpc_config.name}-igw"
  }
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.this.id
  count  = length(local.public_subnets) > 0 ? 1 : 0

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = aws_internet_gateway.this[0].id

  }
  tags = {
    Name = "${var.vpc_config.name}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = local.public_subnets
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.public_rtb[0].id
}
