output "region_1" {
  value       = data.aws_region.region_1.name
  description = "First region name"
}

output "region_2" {
  value       = data.aws_region.region_2.name
  description = "Second region name"
}

output "instance_region_1_az" {
  value = aws_instance.region_1.availability_zone
  description = "First region instance AZ"
}

output "instance_region_2_az" {
  value = aws_instance.region_2.availability_zone
  description = "Second region instance AZ"
}