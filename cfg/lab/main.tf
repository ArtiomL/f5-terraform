# Infrastructure

provider "aws" {
	region = "${var.aws_region}"
}

resource "aws_vpc" "main" {
	tags {
		Name = "${var.tag_name}"
	}
	cidr_block = "${var.cidr_block}"
	assign_generated_ipv6_cidr_block = true
	enable_dns_support = true
	enable_dns_hostnames = true
}
