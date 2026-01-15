module "database" {
  source = "./modules/rds"


  project_name       = "project_rds_module"
  security_group_ids = []
  subnet_ids         = []
  credentials = {
    username = "admin"
    password = "Az1234"
  }
}
