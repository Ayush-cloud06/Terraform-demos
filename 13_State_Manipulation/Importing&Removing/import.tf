terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {

      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

/*
import via CLI
import via import code block
*/

/*
import {
  to = aws_s3_bucket.my_bucket
  id = "terraform-lab-066"
} 
#REMOVED AFTER IMPORT

*/
// Alternatively CLI command: 
// terraform import aws_s3_bucket.my_bucket terraform-lab-066

moved {
  from = aws_s3_bucket.my_bucket
  to   = aws_s3_bucket.my_bucketv2
}
resource "aws_s3_bucket" "my_bucketv2" {
  bucket = "terraform-lab-066"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Environment = "Practice"
    Name        = "My bucket"
    State       = "Imported via import block"
  }
}

#To Remove the resource from state without deleting the actual resource


/*resource "aws_s3_bucket" "to_be_removed" {
  bucket = "terraform-lab-067"


  tags = {
    Environment = "Practice"
    Name        = "To be removed"
    State       = "Will be removed from state"
  }
}*/

removed {
  from = aws_s3_bucket.to_be_removed

  lifecycle {
    destroy = false // if set to true, it will delete the actual resource
  }
}
# Now to remove the "to_be_removed" resource from state without deleting the actual resource
# Alternatively Run the command: terraform state rm (-dry-run to preview) aws_s3_bucket.to_be_removed
