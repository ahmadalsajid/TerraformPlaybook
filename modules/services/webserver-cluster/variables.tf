variable "cluster_name" {
  description = "cluster name to identify all resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "S3 bucket for DB remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "path for DB remote state in S3"
  type        = string
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "min_size" {
  description = "minimum number of Ec2"
  type        = number
}

variable "max_size" {
  description = "maximum number of Ec2"
  type        = number
}

variable "custom_tags" {
  description = "Custom tags to set on ASG"
  type        = map(string)
  default     = {}
}