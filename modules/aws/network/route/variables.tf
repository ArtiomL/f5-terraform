# Route Table Input Variables

variable "vpc_id" {
	description = "VPC ID"
}

variable "igw_id" {
	description = "Internet Gateway ID"
}

variable "tag_name" {
	description = "Route Table Name tag"
	default = "F5Labs"
}

variable "tag_environment" {
	description = "Route Table Environment tag"
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
