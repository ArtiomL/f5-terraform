# Input Variables

variable "azure_region" {
	description = "Azure region"
	default = "West Europe"
}

variable "tag_name" {
	description = "Name tag"
	default = "F5LabsSTG"
}

variable "vnet_cidr" {
	description = "VNet IPv4 CIDR block"
	default = ["10.200.0.0/16"]
}

variable "mgmt_cidr" {
	description = "Management subnet IPv4 CIDR block"
	default = "10.200.113.0/24"
}

variable "ext_cidr" {
	description = "External subnet IPv4 CIDR block"
	default = "10.200.115.0/24"
}

variable "int_cidr" {
	description = "Internal subnet IPv4 CIDR block"
	default = "10.200.112.0/24"
}

variable "key_path" {
	description = "SSH public key path"
	default = "/home/user/.ssh/id_rsa.pub"
}

variable "mgmt_asrc" {
	description = "Source IPv4 CIDR block(s) allowed to access management"
	default = ["0.0.0.0/0"]
}

variable "bigip_armt" {
	description = "BIG-IP Azure Resource Manager template"
	default = "https://raw.githubusercontent.com/F5Networks/f5-azure-arm-templates/master/supported/failover/same-net/via-api/n-nic/existing-stack/byol/azuredeploy.json"
}

variable "bigip_user" {
	description = "BIG-IP username"
	default = "batman"
}

variable "bigip_pass" {
	description = "BIG-IP password"
	default = "D@rk-Kn!ght1"
}

variable "bigip_lic1" {
	description = "BIG-IP1 Registration Key"
	default = "ABCDE-FGHIJ-KLMNO-PQRST-UVWXYZA"
}

variable "bigip_lic2" {
	description = "BIG-IP2 Registration Key"
	default = "ABCDE-FGHIJ-KLMNO-PQRST-UVWXYZA"
}
