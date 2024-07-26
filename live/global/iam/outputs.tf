output "upper_names" {
  value = [for name in var.user_names : upper(name)]
}

output "upper_names_with_condition" {
  value = [for name in var.user_names : upper(name) if length(name) < 6]
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
  value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}

output "neo_cloudwatch_policy_arn" {
  value = one(concat(aws_iam_user_policy_attachment.neo_cloudwatch_full_access[*].policy_arn, aws_iam_user_policy_attachment.neo_cloudwatch_read_only[*].policy_arn))
}