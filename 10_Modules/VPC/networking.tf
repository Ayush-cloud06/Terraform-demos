
data "aws_availability_zones" "azs" {
  state = "available"

}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.5.1"

  cidr            = "10.0.0.0/16"
  name            = "10-VPC"
  azs             = data.aws_availability_zones.azs.names
  private_subnets = ["10.0.0.0/24"]
  public_subnets  = ["10.0.128.0/24"]
}
