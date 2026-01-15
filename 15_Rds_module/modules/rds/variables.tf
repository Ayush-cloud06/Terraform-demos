
variable "project_name" {
  type        = string
  description = "The RDS instance name, and add relevant tags"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "The instance class used to create the database under freetier account"

  validation {
    condition     = contains(["db.t3.micro"], var.instance_class)
    error_message = "only db.t4.micro is allowed"
  }
}

variable "storage_size" {
  type        = number
  default     = 10
  description = "The amout of data to allocate to database, should be between 5 and 10 GB"

  validation {
    condition     = var.storage_size > 5 && var.storage_size <= 10
    error_message = "DB storage value must be between 5 and 10 GB"
  }
}

variable "engine" {
  type        = string
  default     = "postres-latest"
  description = "Engine to use, only postgres in currently supported"

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

  sensitive   = true
  description = "The root username and password for the database"

  validation {
    condition = (
      length(regexall("[a-zA-Z]+", var.credentials.password)) > 0
      && length(regexall("[0-9]+", var.credentials.password)) > 0
      && length(regexall("[a-zA-Z0-9]{6,}", var.credentials.password)) > 0

    )
    error_message = "Must contain 6 character, with 1 digit and 1 special character"
  }
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subenet ids to deploy RDS instance in"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group ids to attach to the RDS instance"
}
