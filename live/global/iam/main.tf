terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # backend "s3" {
  #     bucket         = "sajid-terraform-up-and-running-state"
  #     key            = "global/iam/terraform.tfstate"
  #     region         = "us-east-2"
  #     dynamodb_table = "terraform-up-and-running-lock"
  #     encrypt        = true
  #   }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name     = each.value
}

data "aws_iam_policy_document" "cloudwatch_read_only" {
  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*"
    ]
    resources = ["*"]
  }
}


data "aws_iam_policy_document" "cloudwatch_full_access" {
  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "cloudwatch_read_only" {
  name   = "cloudwatch-read-only"
  policy = data.aws_iam_policy_document.cloudwatch_read_only.json
}

resource "aws_iam_policy" "cloudwatch_full_access" {
  name   = "cloudwatch-full-access"
  policy = data.aws_iam_policy_document.cloudwatch_full_access.json
}

resource "aws_iam_user_policy_attachment" "neo_cloudwatch_full_access" {
  count = var.give_neo_full_access ? 1 : 0

  policy_arn = aws_iam_policy.cloudwatch_full_access.arn
  user       = aws_iam_user.example[0].name
}

resource "aws_iam_user_policy_attachment" "neo_cloudwatch_read_only" {
  count = var.give_neo_full_access ? 0 : 1

  policy_arn = aws_iam_policy.cloudwatch_read_only.arn
  user       = aws_iam_user.example[0].name
}