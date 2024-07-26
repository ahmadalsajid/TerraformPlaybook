variable "db_username" {
  description = "The DB master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The DB master password"
  type        = string
  sensitive   = true
}
variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "prod_db"
}
