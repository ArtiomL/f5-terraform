# IAM Input Variables

variable "tag_name" {
  description = "Name tag"
  default     = "F5Labs"
}

variable "tag_environment" {
  description = "Environment tag"
  default     = "DEV"
}

variable "assume_role_policy" {
  description = "Policy that grants an entity permission to assume the role"
  default     = ""
}

variable "policy" {
  description = "Policy document"
  default     = ""
}

variable "path" {
  description = "Path to the role"
  default     = ""
}
