# Network Input Variables

variable "aws_region" {
	description = "AWS region"
	default = "eu-central-1"
}


# --- Tags --- #

variable "tag_name" {
	description = "Name tag"
	default = "F5Labs"
}

variable "tag_environment" {
	description = "Environment tag"
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


# --- VPC Module --- #

variable "vpc_cidr" {
	description = "VPC IPv4 CIDR block"
	default = "10.200.0.0/16"
}


# --- Subnet Module --- #
