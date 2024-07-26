output "user_arns" {
  value       = module.users[*].user_arn
  description = "All IAM users ARN"
}

output "all_arns" {
  value       = values(module.users)[*].user_arn
  description = "All IAM users ARN"
}