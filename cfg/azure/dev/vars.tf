# Input Variables

variable "azure_region" {
	description = "Azure region"
	default = "West Europe"
}

variable "tag_name" {
	description = "Name tag"
	default = "F5LabsDEV"
}

variable "vnet_cidr" {
	description = "VNet IPv4 CIDR block"
	default = ["10.200.0.0/16"]
}
