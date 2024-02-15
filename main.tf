resource "random_uuid" "main" {}

resource "aws_efs_file_system" "main" {
  creation_token = random_uuid.main.result

  # Encryption
  encrypted  = var.encrypted
  kms_key_id = var.enable_customer_managed_kms ? module.kms[0].key_arn : var.kms_key_id

  # Performance
  performance_mode                = var.performance_mode
  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps

  lifecycle_policy {
    transition_to_ia = var.transition_to_ia
  }

  lifecycle_policy {
    transition_to_archive = var.transition_to_archive
  }

  lifecycle_policy {
    transition_to_primary_storage_class = var.transition_to_primary_storage_class
  }

  tags = merge(var.tags, {
    "Name" = var.name
  })
}

resource "aws_efs_mount_target" "main" {
  count = length(var.private_subnets)

  file_system_id = aws_efs_file_system.main.id

  security_groups = var.security_groups
  subnet_id       = var.private_subnets[count.index]
}

resource "aws_efs_file_system_policy" "main" {
  file_system_id = aws_efs_file_system.main.id

  policy                             = data.aws_iam_policy_document.main.json
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
}

resource "aws_efs_access_point" "main" {
  for_each = var.access_points

  file_system_id = aws_efs_file_system.main.id

  dynamic "posix_user" {
    for_each = each.value.posix_user != null ? [each.value.posix_user] : []

    content {
      uid            = posix_user.value.uid
      gid            = posix_user.value.gid
      secondary_gids = posix_user.value.secondary_gids
    }
  }

  dynamic "root_directory" {
    for_each = each.value.root_directory != null ? [each.value.root_directory] : []

    content {
      path = root_directory.value.path

      dynamic "creation_info" {
        for_each = root_directory.value.creation_info != null ? [root_directory.value.creation_info] : []

        content {
          owner_uid   = creation_info.value.owner_uid
          owner_gid   = creation_info.value.owner_gid
          permissions = creation_info.value.permissions
        }
      }
    }
  }

  tags = merge(var.tags, {
    "Name" = "${var.name}-${each.key}"
  })
}

module "backup" {
  count = var.enable_enhanced_backups ? 1 : 0

  source  = "geekcell/backup/aws"
  version = ">= 1.0.0, < 2.0.0"

  vault_name  = var.name
  backup_name = var.name

  service   = "efs"
  resources = [aws_efs_file_system.main.arn]

  tags = var.tags
}

module "kms" {
  count = var.enable_customer_managed_kms ? 1 : 0

  source  = "geekcell/kms/aws"
  version = ">= 1.0.0, < 2.0.0"

  alias = format("alias/efs/%s", var.name)
  tags  = var.tags
}
