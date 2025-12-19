
locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }

  output_private_subnets = {
    for key in keys(local.private_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The AWS ID from the created VPC"
}

output "public_subnet" {
  value       = local.output_public_subnets
  description = "Map of public subnets with their IDs and AZs"
}

output "private_subnet" {
  value       = local.output_public_subnets
  description = "Map of private subnets with their IDs and AZs"
}
