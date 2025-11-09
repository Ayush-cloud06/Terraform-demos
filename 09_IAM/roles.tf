locals {
  role_policies = {
    readonly = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]
  }
  developer = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]
  admin = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]

}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "roles" {
  for_each           = toset(keys(local.role_policies))
  name               = each.key
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
