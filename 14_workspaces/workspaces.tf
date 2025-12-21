/* CLI:  terraform workspace -help
Usage: terraform [global options] workspace

  new, list, show, select and delete Terraform workspaces.

Subcommands:
    delete    Delete a workspace
    list      List Workspaces
    new       Create a new workspace
    select    Select a workspace
    show      Show the name of the current workspace */

locals {
  bucket_count_per_workspace = {
    project = 1
    staging = 2
    prod    = 3
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-workspace-bucket-${random_id.bucket_suffix.hex}-${terraform.workspace}" //terraform.workspace will give the current workspace name


  for_each = toset(
    range(
      lookup(local.bucket_count_per_workspace, terraform.workspace, 0)
    )
  )
}

/* CLI :  terraform workspace new project
Created and switched to workspace "project"! 


The "project" workspace has its own isolated state.
Running terraform apply in this workspace will create
a separate instance of the S3 bucket.
*/

