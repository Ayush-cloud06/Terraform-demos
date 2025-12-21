resource "aws_s3_bucket" "tainted" {
  bucket = "terraform-lab-tainted-001"
}

// bucket created via terraform apply and then deleted manually from AWS Console
#Tainting : To mark a resource for recreation on next apply
//CLI : terraform taint aws_s3_bucket.tainted
// similarly untaint command is also available: terraform untaint aws_s3_bucket.tainted


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

// Dependent resources may be recreated due to upstream changes,
// but they are not explicitly tainted (as the subnets are not directly tainted because VPC is).

# Modern, one-time replacement can be forced using:
# terraform apply -replace="resource_type.resource_name"

