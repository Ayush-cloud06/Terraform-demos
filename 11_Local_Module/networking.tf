module "networking" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "Local Module"
  }
  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "ap-south-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      az         = "ap-south-1b"
    }
  }
}
