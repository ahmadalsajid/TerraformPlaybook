output "primary_address" {
  value       = module.mysql_primary.address
  description = "Primary DB"
}

output "primary_port" {
  value       = module.mysql_primary.port
  description = "Primary DB port"
}

output "primary_arn" {
  value       = module.mysql_primary.arn
  description = "Primary DB ARN"
}