# Input Variables

variable "aws_region" {
	description = "AWS region"
	default = "eu-central-1"
}

variable "tag_name" {
	description = "Name tag"
	default = "vpcF5Labs"
}

variable "cidr_block" {
	description = "IPv4 CIDR block"
	default = "10.200.0.0/16"
}
