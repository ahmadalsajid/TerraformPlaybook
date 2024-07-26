output "user_arns" {
  value       = aws_iam_user.example
  description = "All IAM users ARN"
}

output "all_arns" {
  value       = values(aws_iam_user.example)[*].arn
  description = "All IAM users ARN"
}