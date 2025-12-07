locals {
  project_name = "11-EC2"
  common_tags = {
    project   = local.project_name
    ManagedBy = "Terraform"
  }
}
