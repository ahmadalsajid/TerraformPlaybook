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

# module "users" {
#   source = "../../../modules/landing-zone/iam-user"
#
#   for_each  = toset(var.user_names)
#   user_name = each.value
# }