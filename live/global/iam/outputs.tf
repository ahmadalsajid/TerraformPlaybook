output "first_arn" {
  value       = aws_iam_user.example[0].arn
  description = "First IAM user's ARN"
}

output "all_arns" {
  value       = aws_iam_user.example[*].arn
  description = "All IAM users ARN"
}