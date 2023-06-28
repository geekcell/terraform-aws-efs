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
  count = var.enable_enhanced_backups ? 1 : 0

  source  = "geekcell/backup/aws"
  version = ">= 1.0.0, < 2.0.0"

  vault_name  = var.name
  backup_name = var.name

  resources = [
    aws_efs_file_system.main.arn
  ]

  service = "efs"
}

module "kms" {
  source  = "geekcell/kms/aws"
  version = ">= 1.0.0, < 2.0.0"

  alias = format("alias/efs/%s", var.name)
}
