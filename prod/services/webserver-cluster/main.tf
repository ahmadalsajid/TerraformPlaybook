provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "github.com/brikis98/terraform-up-and-running-code//code/terraform/04-terraform-module/module-example/modules/services/webserver-cluster?ref=v0.3.0"

  cluster_name           = "webserver-prod"
  db_remote_state_bucket = "sajid-terraform-up-and-running-state"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 3
}


resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  autoscaling_group_name = module.webserver_cluster.asg_name

  scheduled_action_name = "scale_out_during_business_hours"
  min_size = 1
  max_size = 3
  desired_capacity = 1
  recurrence = "0 9 * * *"
}


resource "aws_autoscaling_schedule" "scale_in_at_night" {
  autoscaling_group_name = module.webserver_cluster.asg_name

  scheduled_action_name = "scale_in_at_night"
  min_size = 1
  max_size = 3
  desired_capacity = 1
  recurrence = "0 9 * * *"
}