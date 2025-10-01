
variable "ec2_instance_size" {
  type        = string
  description = "Default size of newly created Ec2 instance"

  validation {
    condition = contains(["t2.micro", "t3.micro"], var.ec2_instance_size)
    //Alternative : var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    error_message = "Only supports t2.micro and t3.micro"
  }
}

variable "ec2_volume_config" {
  type = object({ //can use map instead of "object" but then key will need to be accurately defined
    size = number
    type = string
  })

  description = "The size and type of root volume attached to Ec2"

  default = {
    size = 10
    type = "gp2"
  }
  /*type        = number
  default     = 10
  */
}

/*variable "ec2_volume_type" {
  type        = string
  default     = "gp2"
  description = "The volume type of root volume"
}*/

variable "additional_tags" {
  type    = map(string)
  default = {}
}
