output "user_arns" {
  value       = module.users[*].user_arn
  description = "All IAM users ARN"
}