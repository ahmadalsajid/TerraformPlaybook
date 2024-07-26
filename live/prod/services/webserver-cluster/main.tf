terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "sajid-terraform-up-and-running-state"
    key            = "prod/services/webserver-cluster/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webserver-prod"
  db_remote_state_bucket = "sajid-terraform-up-and-running-state"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 3

  custom_tags = {
    Owner     = "sajid"
    ManagedBy = "terraform"
  }
}


resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  autoscaling_group_name = module.webserver_cluster.asg_name

  scheduled_action_name = "scale_out_during_business_hours"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 1
  recurrence            = "0 9 * * *"
}


resource "aws_autoscaling_schedule" "scale_in_at_night" {
  autoscaling_group_name = module.webserver_cluster.asg_name

  scheduled_action_name = "scale_in_at_night"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 1
  recurrence            = "0 17 * * *"
}