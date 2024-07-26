variable "name" {
  description = "Name to use for all resources created by this module"
  type        = string
}

variable "image" {
  description = "docker image to run"
  type        = string
}

variable "container_port" {
  description = "port docker image listens on"
  type        = number
  default     = 5000
}

variable "replicas" {
  description = "how many replicas to run"
  type        = number
}

variable "environment_variables" {
  description = "environment variables to set for the app"
  type = map(string)
  default = {}
}