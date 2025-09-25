
//inital block

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

#general resource block

/*resource "resource name" "tag attached (ALWAYS UNIQUE)" {
    identifier(bucket in case of s3) = "name for identifier"
}*/

#ex: 

resource "aws_s3_bucket" "My_bucker" {
  bucket = var.bucket_name

  #later using the the value from variable   
  # 'bucket' won't work incase of "aws_vpc" and its not valid identifier for Vpc
}

#sdata block for resources not managed by us (eg for accessing from remote api)

data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us"
}

#Variables : 

variable "bucket_name" {
  type        = string
  description = "bucket name Var"
  default     = "bucket"
}

#output block : expose info. externally

output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

#for complex proceesing or filtering  , use locals block `kinda like temp variable`

locals {
  local_example = "This is a local variable"
}

#module: reusable block ... 

module "my_module" {
  source = "./module.example"
}


