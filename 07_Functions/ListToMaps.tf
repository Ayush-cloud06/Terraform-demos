
locals {
  users_map = {
    for userInfo in var.users : userInfo.username => userInfo.role
  }
}

output "users_map" {
  value = local.users_map
}
