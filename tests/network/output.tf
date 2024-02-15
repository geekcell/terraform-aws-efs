output "vpc_id" {
  value = aws_default_vpc.default.id
}

output "security_group_id" {
  value = aws_default_security_group.default.id
}

output "subnet_ids" {
  value = [data.aws_subnet.default.id]
}
