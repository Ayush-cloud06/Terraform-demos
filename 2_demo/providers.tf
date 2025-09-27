
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "freedomLand"
  //skip_region_validation = false (use if your .env already have a default region)
}

provider "aws" {
  region = "ap-south-1"
  alias  = "SomeoneSaidYoga"
}


resource "aws_s3_bucket" "india" {
  bucket   = "ayush-cloud-09ssssss"
  provider = aws.SomeoneSaidYoga

}

resource "aws_s3_bucket" "usa" {
  bucket   = "ayush-random-0666ss"
  provider = aws.freedomLand
}
