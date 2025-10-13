locals {
  users_map = {
    for userInfo in var.users : userInfo.username => userInfo.role...
  }

  users_map2 = {
    for username, roles in local.users_map : username => {
      roles = roles
    }
  }
}

output "users_map" {
  value = local.users_map
}

output "users_map2" {
  value = local.users_map2
}
