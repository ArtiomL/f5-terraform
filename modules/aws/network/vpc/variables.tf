# VPC Input Variables

variable "cidr_block" {
	description = "VPC IPv4 CIDR block"
	default = "10.200.0.0/16"
}

variable "ipv6_cidr_block" {
	description = "Associate an IPv6 CIDR block with the VPC"
	default = true
}

variable "enable_dns_support" {
	description = "Enable DNS support in the VPC"
	default = true
}

variable "enable_dns_hostnames" {
	description = "Enable DNS hostnames in the VPC"
	default = true
}

variable "create_igw" {
	description = "Attach an internet gateway to the VPC"
	default = true
}

variable "tag_name" {
	description = "VPC Name tag"
	default = "F5Labs"
}

variable "tag_environment" {
	description = "VPC Environment tag"
	default = "DEV"
}

variable "tags_shared" {
	description = "Other tags assigned to all resources"
	type = "map"
	default = {
		Owner = "T.Durden"
		BusinessUnit = "R&D"
		CostCenter = "7741"
		Project = "Mayhem"
	}
}
