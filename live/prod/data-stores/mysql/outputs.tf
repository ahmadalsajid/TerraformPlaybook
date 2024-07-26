output "address" {
  value = aws_db_instance.example.address
  description = "database connection endpoint"
}

output "port" {
  value = aws_db_instance.example.port
  description = "database connection port"
}