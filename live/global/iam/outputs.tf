output "upper_names" {
  value = [for name in var.user_names : upper(name)]
}

output "upper_names_with_condition" {
  value = [for name in var.user_names : upper(name) if length(name) < 6]
}