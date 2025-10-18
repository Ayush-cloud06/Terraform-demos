
locals {
  firstnames_from_splat = var.users[*].username //splat operator to extract all usernames from the list of objects
  lastnames_from_splat  = var.users[*].role     //splat operator to extract all lastnames from the list of objects
}

output "firstnames_from_splat" {
  value = local.firstnames_from_splat
}

output "lastnames_from_splat" {
  value = local.lastnames_from_splat
}
