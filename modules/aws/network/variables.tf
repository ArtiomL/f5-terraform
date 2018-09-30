# Network Input Variables

variable "aws_region" {
  description = "AWS region"
  default     = "eu-central-1"
}

# --- Tags --- #

variable "tag_name" {
  description = "Name tag"
  default     = "F5Labs"
}

variable "tag_environment" {
  description = "Environment tag"
  default     = "DEV"
}

variable "tags_shared" {
  description = "Other tags assigned to all resources"
  type        = "map"
  default = {
    Owner        = "T.Durden"
    BusinessUnit = "R&D"
    CostCenter   = "7741"
    Project      = "Mayhem"
  }
}

# --- VPC Module --- #

variable "vpc_cidr" {
  description = "VPC IPv4 CIDR block"
  default     = "10.200.0.0/16"
}

# --- Subnet Module --- #

variable "az_names" {
  description = "Subnet Availability Zone list"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "mgmt_cidrs" {
  description = "Management subnet IPv4 CIDR blocks"
  default     = ["10.200.113.0/24", "10.200.123.0/24"]
}

variable "ext_cidrs" {
  description = "External subnet IPv4 CIDR blocks"
  default     = ["10.200.115.0/24", "10.200.125.0/24"]
}

variable "int_cidrs" {
  description = "Internal subnet IPv4 CIDR blocks"
  default     = ["10.200.112.0/24", "10.200.122.0/24"]
}
