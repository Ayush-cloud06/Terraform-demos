
resource "aws_vpc" "primary" {
  cidr_block = "10.0.0.0/16"

  tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = "10.0.0.0/24"
}
