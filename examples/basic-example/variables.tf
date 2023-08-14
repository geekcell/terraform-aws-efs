variable "storage_name" {
  default     = "storage"
  description = "Storage name."
  type        = string
}

variable "private_subnets" {
  default     = ["subnet-12345678", "subnet-12345678"]
  description = "Private subnets to add a mount point for storage."
  type        = list(string)
}

variable "security_groups" {
  default     = []
  description = "Security groups to attach to storage."
  type        = list(string)
}
