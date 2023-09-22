data "aws_iam_policy_document" "main" {
  dynamic "statement" {
    for_each = [true]

    content {
      sid       = "AccessRules"
      resources = [aws_efs_file_system.main.arn]
      effect    = "Allow"

      principals {
        type        = "AWS"
        identifiers = var.aws_iam_principals
      }

      actions = compact([
        !var.prevent_root_access_default ? "elasticfilesystem:ClientRootAccess" : null,
        !var.enforce_read_only_default ? "elasticfilesystem:ClientWrite" : null,
        !var.prevent_anonymous_access ? "elasticfilesystem:ClientMount" : null,
      ])

      condition {
        test     = "Bool"
        variable = "elasticfilesystem:AccessedViaMountTarget"
        values   = ["true"]
      }
    }
  }

  dynamic "statement" {
    for_each = var.enforce_transit_encryption ? [true] : []

    content {
      sid       = "EnforceInTransitEncryption"
      resources = [aws_efs_file_system.main.arn]
      effect    = "Deny"
      actions   = ["*"]

      principals {
        type        = "AWS"
        identifiers = ["*"]
      }

      condition {
        test     = "Bool"
        variable = "aws:SecureTransport"
        values   = ["false"]
      }
    }
  }
}
