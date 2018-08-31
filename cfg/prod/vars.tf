# Input Variables

variable "aws_region" {
	description = "AWS region"
	default = "eu-central-1"
}

variable "tag_name" {
	description = "VPC Name tag"
	default = "F5LabsPROD"
}

variable "vpc_cidr" {
	description = "VPC IPv4 CIDR block"
	default = "10.200.0.0/16"
}

variable "mgmt1_cidr" {
	description = "Management subnet IPv4 CIDR block in AZ1"
	default = "10.200.113.0/24"
}

variable "mgmt2_cidr" {
	description = "Management subnet IPv4 CIDR block in AZ2"
	default = "10.200.123.0/24"
}

variable "ext1_cidr" {
	description = "External subnet IPv4 CIDR block in AZ1"
	default = "10.200.115.0/24"
}

variable "ext2_cidr" {
	description = "External subnet IPv4 CIDR block in AZ2"
	default = "10.200.125.0/24"
}

variable "int1_cidr" {
	description = "Internal subnet IPv4 CIDR block in AZ1"
	default = "10.200.112.0/24"
}

variable "int2_cidr" {
	description = "Internal subnet IPv4 CIDR block in AZ2"
	default = "10.200.122.0/24"
}

variable "key_path" {
	description = "SSH public key path"
	default = "/home/user/.ssh/id_rsa.pub"
}

variable "mgmt_asrc" {
	description = "Source IPv4 CIDR block(s) allowed to access management"
	default = ["0.0.0.0/0"]
}

variable "bigip_cft" {
	description = "BIG-IP CloudFormation template"
	default = "https://s3.amazonaws.com/f5-cft/f5-existing-stack-across-az-cluster-byol-3nic-bigip.template"
}

variable "bigip_lic1" {
	description = "BIG-IP1 Registration Key"
	default = "ABCDE-FGHIJ-KLMNO-PQRST-UVWXYZA"
}

variable "bigip_lic2" {
	description = "BIG-IP2 Registration Key"
	default = "ABCDE-FGHIJ-KLMNO-PQRST-UVWXYZA"
}
