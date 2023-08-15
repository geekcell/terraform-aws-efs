output "arn" {
  value       = aws_efs_file_system.main.arn
  description = "ARN of filesystem."
}

output "id" {
  value       = aws_efs_file_system.main.id
  description = "Id of filesystem."
}

output "dns_name" {
  value       = aws_efs_file_system.main.dns_name
  description = "DNS address of filesystem."
}

output "size_in_bytes" {
  value       = aws_efs_file_system.main.size_in_bytes
  description = "DNS address of filesystem."
}

output "number_of_mount_targets" {
  value       = aws_efs_file_system.main.number_of_mount_targets
  description = "DNS address of filesystem."
}

output "kms_key_id" {
  value       = aws_efs_file_system.main.kms_key_id
  description = "DNS address of filesystem."
}
