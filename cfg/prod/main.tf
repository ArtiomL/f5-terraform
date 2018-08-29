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

# Management subnet in AZ1
resource "aws_subnet" "mgmt1" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}a"
	cidr_block = "${var.mgmt1_cidr}"
	tags {
		Name = "snetMgmt1"
	}
}

# Management subnet in AZ2
resource "aws_subnet" "mgmt2" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}b"
	cidr_block = "${var.mgmt2_cidr}"
	tags {
		Name = "snetMgmt2"
	}
}

# External subnet in AZ1
resource "aws_subnet" "ext1" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}a"
	cidr_block = "${var.ext1_cidr}"
	tags {
		Name = "snetExternal1"
	}
}

# External subnet in AZ2
resource "aws_subnet" "ext2" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}b"
	cidr_block = "${var.ext2_cidr}"
	tags {
		Name = "snetExternal2"
	}
}

# Internal subnet in AZ1
resource "aws_subnet" "int1" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}a"
	cidr_block = "${var.int1_cidr}"
	tags {
		Name = "snetInternal1"
	}
}

# Internal subnet in AZ2
resource "aws_subnet" "int2" {
	vpc_id = "${aws_vpc.main.id}"
	availability_zone = "${var.aws_region}b"
	cidr_block = "${var.int2_cidr}"
	tags {
		Name = "snetInternal2"
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

# Assign route table to management subnet in AZ1
resource "aws_route_table_association" "mgmt1" {
	subnet_id = "${aws_subnet.mgmt1.id}"
	route_table_id = "${aws_route_table.public.id}"
}

# Assign route table to management subnet in AZ2
resource "aws_route_table_association" "mgmt2" {
	subnet_id = "${aws_subnet.mgmt2.id}"
	route_table_id = "${aws_route_table.public.id}"
}

# Assign route table to external subnet in AZ1
resource "aws_route_table_association" "ext1" {
	subnet_id = "${aws_subnet.ext1.id}"
	route_table_id = "${aws_route_table.public.id}"
}

# Assign route table to external subnet in AZ2
resource "aws_route_table_association" "ext2" {
	subnet_id = "${aws_subnet.ext2.id}"
	route_table_id = "${aws_route_table.public.id}"
}
