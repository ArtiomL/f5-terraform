# Subnet Input Variables

variable "vpc_id" {
  description = "VPC ID"
}

variable "az_names" {
  description = "Subnet Availability Zone list"
  type        = "list"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "cidr_blocks" {
  description = "Subnet IPv4 CIDR block list"
  type        = "list"
  default     = ["10.200.113.0/24", "10.200.123.0/24"]
}

variable "map_public_ip" {
  description = "Instances launched into this subnet should be assigned a public IP address"
  default     = "true"
}

variable "rt_associate" {
  description = "Associate with a routing table"
  default     = "true"
}

variable "route_table_id" {
  description = "ID of the routing table to associate with"
  default     = ""
}

variable "tag_name" {
  description = "Subnet Name tag"
  default     = "Mgmt"
}

variable "tag_environment" {
  description = "Subnet Environment tag"
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
