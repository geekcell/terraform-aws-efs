# Context
variable "tags" {
  default     = {}
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
}

# AWS EFS
variable "bypass_policy_lockout_safety_check" {
  default     = false
  description = "A flag to indicate whether to bypass the aws_efs_file_system_policy lockout safety check."
  type        = bool
}

variable "enable_enhanced_backups" {
  default     = false
  description = "Enable enhanced backups."
  type        = bool
}

variable "encrypted" {
  default     = true
  description = "If true, the disk will be encrypted."
  type        = bool
}

variable "kms_key_id" {
  description = "The ARN of the AWS KMS to encrypt the file system. Defaults to the AWS managed KMS key."
  default     = null
  type        = string
}

variable "enable_customer_managed_kms" {
  description = "If enabled, will create a customer managed KMS key for at-rest encryption."
  default     = false
  type        = bool
}

variable "name" {
  description = "The name of the file system."
  type        = string
}

variable "performance_mode" {
  default     = "generalPurpose"
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`."
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  type        = list(string)
}

variable "provisioned_throughput_in_mibps" {
  default     = 0
  description = "The throughput, measured in MiB/s, that you want to provision for the file system."
  type        = number
}

variable "security_groups" {
  description = "A list of security group IDs to associate with the file system."
  type        = list(string)
}

variable "throughput_mode" {
  default     = "elastic"
  description = "Throughput mode for the file system. Valid values: `bursting`, `provisioned`, or `elastic`."
  type        = string
}

variable "transition_to_ia" {
  default     = "AFTER_30_DAYS"
  description = "Indicates how long it takes to transition files to the IA storage class. Accepted values AFTER_7_DAYS, AFTER_14_DAYS, AFTER_30_DAYS, AFTER_60_DAYS, AFTER_90_DAYS."
  type        = string
}

variable "transition_to_primary_storage_class" {
  default     = "AFTER_1_ACCESS"
  description = "Describes the policy used to transition a file from infequent access storage to primary storage. Only AFTER_1_ACCESS is accepted"
  type        = string
}

variable "transition_to_archive" {
  default     = "AFTER_90_DAYS"
  description = "Indicates how long it takes to transition files to the archive storage class. Accepted values AFTER_7_DAYS, AFTER_14_DAYS, AFTER_30_DAYS, AFTER_60_DAYS, AFTER_90_DAYS."
  type        = string
}

variable "access_points" {
  default     = {}
  description = "List of access points to create."
  type = map(object({
    posix_user = optional(object({
      gid            = number
      uid            = number
      secondary_gids = optional(list(number))
    }))

    root_directory = optional(object({
      path = string

      creation_info = optional(object({
        owner_gid   = number
        owner_uid   = number
        permissions = string
      }))
    }))
  }))
}

variable "aws_iam_principals" {
  description = "AWS IAM principals which will be allowed to access the file system via the EFS policy."
  default     = ["*"]
  type        = list(string)
}

variable "prevent_root_access_default" {
  description = "Prevent root access to the file system. Identity-based policies can override these default permissions."
  default     = false
  type        = bool
}

variable "enforce_read_only_default" {
  description = "Enforce read-only access to the file system. Identity-based policies can override these default permissions."
  default     = false
  type        = bool
}

variable "prevent_anonymous_access" {
  description = "Prevent anonymous access to the file system."
  default     = false
  type        = bool
}

variable "enforce_transit_encryption" {
  description = "Enforce in-transit encryption for all clients."
  default     = true
  type        = bool
}
