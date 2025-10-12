
/*variable "Cloud_providers" {
  default = ["AWS", "GCP", "AZURE"]

}
*/

variable "Number_of_instances" {
  type = list(number)
}


variable "map_instance" {
  type = list(object({
    instance_number   = number
    instance_provider = string
  }))
}
