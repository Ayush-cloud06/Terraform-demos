
data "aws_availability_zones" "available" {
  state = "available"

}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_config.cidr_block

  tags = {
    Name = var.vpc_config.name
  }
}

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
