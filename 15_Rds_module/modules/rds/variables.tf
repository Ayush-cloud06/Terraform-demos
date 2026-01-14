variable "project_name" {
  type = string
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"

  validation {
    condition     = contains(["db.t3.micro"], var.instance_class)
    error_message = "only db.t4.micro is allowed"
  }
}

variable "storage_size" {
  type    = number
  default = 10

  validation {
    condition     = var.storage_size > 5 && var.storage_size <= 10
    error_message = "DB storage value must be between 5 and 10 GB"
  }
}

variable "engine" {
  type    = string
  default = "postres-latest"

  validation {
    condition     = contains(["postres-latest", "postgres-14"], var.engine)
    error_message = "DB message must be postgres-14 or higher"
  }
}

variable "credentials" {
  type = object({
    username = string
    password = string
  })

  sensitive = true

  validation {
    condition = (
      length(regexall("[a-zA-Z]+", var.credentials.password)) > 0
      && length(regexall("[0-9]+", var.credentials.password)) > 0
      && length(regexall("[a-zA-Z0-9]{6,}", var.credentials.password)) > 0

    )
    error_message = "Must contain 6 character, with 1 digit and 1 special character"
  }
}
