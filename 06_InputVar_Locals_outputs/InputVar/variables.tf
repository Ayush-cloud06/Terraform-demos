
variable "ec2_instance_size" {
  type        = string
  default     = "t2.micro"
  description = "Default size of newly created Ec2 instance"

  validation {
    condition = contains(["t2.micro", "t3.micro"], var.ec2_instance_size)
    //Alternative : var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    error_message = "Only supports t2.micro and t3.micro"
  }
}

variable "ec2_volume_size" {
  type        = number
  default     = 10
  description = "The size in GB to root volume attached to Ec2"
}

variable "ec2_volume_type" {
  type        = string
  default     = "gp2"
  description = "The volume type of root volume"
}
