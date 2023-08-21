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
  default     = "bursting"
  description = "Throughput mode for the file system. Defaults to bursting."
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

variable "accessors_read_write" {
  default     = []
  description = "List of accessors that are allowed to read & write."
  type        = list(string)
}
