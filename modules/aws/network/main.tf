# Infrastructure

provider "aws" {
	region = "${var.aws_region}"
}

# VPC
module "vpc" {
	source = "./vpc"
	cidr_block = "${var.vpc_cidr}"
	tag_name = "${var.tag_name}"
	tag_environment = "${var.tag_environment}"
	tags_shared = "${var.tags_shared}"
}
