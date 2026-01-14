module "database" {
  source = "./modules/rds"


  project_name = "project_rds_module"
  credentials = {
    username = "admin"
    password = "Az1234"
  }
}
