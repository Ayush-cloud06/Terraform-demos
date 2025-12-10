variable "vpc_cidr" {
  type = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "The provided VPC CIDR block is not valid."
  }
}

variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

variable "vpc_config" {
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The provided config VPC CIDR block is not valid."
  }

}
