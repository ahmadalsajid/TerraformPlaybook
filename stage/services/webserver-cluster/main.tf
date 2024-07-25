terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webserver-stage"
  db_remote_state_bucket = "sajid-terraform-up-and-running-state"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 3
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  from_port         = 12121
  protocol          = "tcp"
  security_group_id = module.webserver_cluster.alb_security_group_id
  to_port           = 12121
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

