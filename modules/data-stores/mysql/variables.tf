variable "db_username" {
  description = "The DB master username"
  type        = string
  sensitive   = true
  default     = null
}

variable "db_password" {
  description = "The DB master password"
  type        = string
  sensitive   = true
  default     = null
}
variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "Backup retention period, must be > 0 to enable replication"
  type        = number
  default     = null
}

variable "replicate_source_db" {
  description = "If specified, replicate the RDS database at the given ARN."
  type        = string
  default     = null
}