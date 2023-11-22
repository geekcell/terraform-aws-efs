## FILE SYSTEM
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
  description = "Size of the EFS file system."
}

output "number_of_mount_targets" {
  value       = aws_efs_file_system.main.number_of_mount_targets
  description = "Number of mount targets of the EFS file system."
}

output "kms_key_id" {
  value       = aws_efs_file_system.main.kms_key_id
  description = "ID of the KMS key used to encrypt the EFS."
}

## ACCESS POINTS
output "access_point_ids" {
  value       = { for key, val in aws_efs_access_point.main : key => val.id }
  description = "IDs of created access points."
}

output "access_point_arns" {
  value       = { for key, val in aws_efs_access_point.main : key => val.arn }
  description = "ARNs of created access points."
}
