# Infrastructure

provider "aws" {
	region = "${var.aws_region}"
}

# VPC
resource "aws_vpc" "main" {
	cidr_block = "${var.vpc_cidr}"
	assign_generated_ipv6_cidr_block = true
	enable_dns_support = true
	enable_dns_hostnames = true
	tags {
		Name = "vpc${var.tag_name}"
	}
}

# Management subnet
resource "aws_subnet" "mgmt" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}a"
	cidr_block = "${var.mgmt_cidr}"
	tags {
		Name = "snetMgmt"
	}
}

# External subnet
resource "aws_subnet" "ext" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}a"
	cidr_block = "${var.ext_cidr}"
	tags {
		Name = "snetExternal"
	}
}

# Internal subnet
resource "aws_subnet" "int" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}a"
	cidr_block = "${var.int_cidr}"
	tags {
		Name = "snetInternal"
	}
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
	vpc_id = "${aws_vpc.main.id}"
	tags {
		Name = "igw${var.tag_name}"
	}
}

# Route table
resource "aws_route_table" "public" {
	vpc_id = "${aws_vpc.main.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.gw.id}"
	}
	tags {
		Name = "rtPublic"
	}
}

# Assign route table to management subnet
resource "aws_route_table_association" "mgmt" {
	subnet_id = "${aws_subnet.mgmt.id}"
	route_table_id = "${aws_route_table.public.id}"
}

# Assign route table to external subnet
resource "aws_route_table_association" "ext" {
	subnet_id = "${aws_subnet.ext.id}"
	route_table_id = "${aws_route_table.public.id}"
}
