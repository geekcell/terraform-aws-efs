/**
 * # Terraform AWS EFS
 *
 * This Terraform module provides a preconfigured solution for setting up+
 * AWS EFS file systems in your AWS account. With this module, you can easily
 * and efficiently create and manage EFS file systems with advanced features
 * such as encryption and lifecycle policies for cold storage, as well as
 * extended backup options. Our team has extensive experience working with
 * AWS EFS and has optimized this module to provide the best possible experience
 * for users.
 *
 * By using this Terraform module, you can save time and effort in setting up
 * and managing your EFS file systems, as well as ensure that your data is
 * secure and protected. The module encapsulates all necessary configurations,
 * making it easy to use and integrate into your existing AWS environment.
 * Whether you are just getting started with AWS EFS or looking for a more
 * efficient way to manage your file systems, this Terraform module provides
 * a preconfigured solution with advanced features such as encryption and
 * extended backup options.
 *
 */
resource "aws_efs_file_system" "main" {

  # Creation token
  creation_token = random_uuid.main.result

  # Encryption
  encrypted = var.encrypted

  # KMS
  kms_key_id = module.kms.key_arn

  # Performance Mode
  performance_mode = var.performance_mode

  # Throughput mode
  throughput_mode = var.throughput_mode

  # Throughput provision
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps

  lifecycle_policy {
    transition_to_ia = var.transition_to_ia
  }

  lifecycle_policy {
    transition_to_primary_storage_class = var.transition_to_primary_storage_class
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    }
  )
}

resource "aws_efs_mount_target" "main" {
  for_each        = toset(var.private_subnets)
  file_system_id  = aws_efs_file_system.main.id
  security_groups = var.security_groups
  subnet_id       = each.value
}

resource "aws_efs_file_system_policy" "main" {
  file_system_id = aws_efs_file_system.main.id


  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check

  policy = data.aws_iam_policy_document.main.json
}

resource "random_uuid" "main" {}

module "backup" {
  count  = var.enable_enhanced_backups ? 1 : 0
  source = "github.com/geekcell/terraform-aws-backup?ref=v1.0"

  vault_name  = var.name
  backup_name = var.name

  resources = [
    aws_efs_file_system.main.arn
  ]

  service = "efs"
}

module "kms" {
  source = "github.com/geekcell/terraform-aws-kms?ref=v1.0"

  alias = format("alias/efs/%s", var.name)
}
