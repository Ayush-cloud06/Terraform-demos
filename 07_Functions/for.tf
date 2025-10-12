// For expression lets you transform or filter Lists and Maps


locals {
  updated_instances = [for n in var.Number_of_instances : (n * 2) + 1 if n < 8]
  instance_tally    = [for inst in var.map_instance : "${inst.instance_provider}-${inst.instance_number}"]
}

output "updated_instances" {
  value = local.updated_instances
}

output "instance_tally" {
  value = local.instance_tally
}
