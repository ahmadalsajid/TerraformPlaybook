variable "name" {
  description = "EKS cluster name"
  type        = string
}

variable "min_size" {
  description = "minimum number of nodes in EKS cluster"
  type        = number
}

variable "max_size" {
  description = "maximum number of nodes in EKS cluster"
  type        = number
}

variable "desired_size" {
  description = "desired number of nodes in EKS cluster"
  type        = number
}

variable "instance_types" {
  description = "EC2 instance types to run in the node group"
  type        = list(string)
}