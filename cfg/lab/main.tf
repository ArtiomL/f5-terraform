provider "aws" {
	region = "${var.aws_region}"
}

resource "aws_vpc" "main" {
	tags {
		Name = "test-vpc"
	}
	cidr_block = "10.0.0.0/16"
	assign_generated_ipv6_cidr_block = true
	enable_dns_support = true
	enable_dns_hostnames = true
}
