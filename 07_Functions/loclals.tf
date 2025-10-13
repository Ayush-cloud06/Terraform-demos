
locals {
  Repo       = "my-${6 + 1}-repo"                                //Arithmetic operation : +, -, *, /, %
  Comparison = 5 > 3                                             //Comparison operators : >, <, >=, <=, ==, !=
  Logical    = (5 > 3) && (3 < 4)                                //Logical operators : &&, ||, !
  Condition  = (5 > 3) ? "Five is greater" : "somethig is wrong" //Condition operator : condition ? true_value : false_value
}

output "operators" {
  value = {
    Repo       = local.Repo
    Comparison = local.Comparison
    Logical    = local.Logical
    Condition  = local.Condition
  }
}


provider "aws" {
  region = "us-east-1"
}

