output "user_arn" {
  value = aws_iam_user.example.arn
  description = "ARN of the created IAM user"
}