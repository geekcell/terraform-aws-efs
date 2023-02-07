data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "main" {
  statement {
    sid       = "Allow Access to EFS"
    effect    = "Allow"
    resources = [aws_efs_file_system.main.arn]

    actions = [
      "elasticfilesystem:ClientMount",
      "elasticfilesystem:ClientWrite",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["true"]
    }

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}
