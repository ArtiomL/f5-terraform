# BIG-IP Input Variables

variable "vpc_id" {
  description = "VPC ID"
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

# --- Subnets --- #

variable "az_names" {
  description = "Subnet Availability Zone list"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "subnet_mgmt_ids" {
  description = "Management subnet IDs"
  type        = "list"
}

variable "subnet_ext_ids" {
  description = "External subnet IDs"
  type        = "list"
}

variable "subnet_int_ids" {
  description = "Internal subnet IDs"
  type        = "list"
}

# --- Access --- #

variable "key_id" {
  description = "SSH key pair ID"
}

variable "mgmt_asrc" {
  description = "Source IPv4 CIDR block(s) allowed to access management"
  default     = [""]
}

# --- Licenses --- #

variable "bigip_lic1" {
  description = "BIG-IP1 registration key"
  default     = "ABCDE-FGHIJ-KLMNO-PQRST-UVWXYZA"
}

variable "bigip_lic2" {
  description = "BIG-IP2 registration key"
  default     = "ABCDE-FGHIJ-KLMNO-PQRST-UVWXYZA"
}
