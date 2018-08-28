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
	cidr_block = "${var.mgmt_cidr}"
	tags {
		Name = "snetMgmt"
	}
}

# External subnet
resource "aws_subnet" "ext" {
	vpc_id = "${aws_vpc.main.id}"
	cidr_block = "${var.ext_cidr}"
	tags {
		Name = "snetExternal"
	}
}

# Internal subnet
resource "aws_subnet" "int" {
	vpc_id = "${aws_vpc.main.id}"
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

# Management security group
resource "aws_security_group" "mgmt" {
	name = "sgMgmt"
	description = "Management SSH, HTTPS and ICMP access"
	ingress {
		protocol = "tcp"
		from_port = 22
		to_port = 22
		cidr_blocks = "${var.mgmt_asrc}"
	}
	ingress {
		protocol = "tcp"
		from_port = 443
		to_port = 443
		cidr_blocks = "${var.mgmt_asrc}"
	}
	ingress {
		protocol = "icmp"
		from_port = -1
		to_port = -1
		cidr_blocks = "${var.mgmt_asrc}"
	}
	egress {
		protocol = -1
		from_port = 0
		to_port = 0
		cidr_blocks = ["0.0.0.0/0"]
	}
	vpc_id="${aws_vpc.main.id}"
	tags {
		Name = "sgMgmt"
	}
}

# External security group
resource "aws_security_group" "ext" {
	name = "sgExternal"
	description = "External HTTP, HTTPS and ICMP access"
	ingress {
		protocol = "tcp"
		from_port = 80
		to_port = 80
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		protocol = "tcp"
		from_port = 443
		to_port = 443
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		protocol = "icmp"
		from_port = -1
		to_port = -1
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		protocol = -1
		from_port = 0
		to_port = 0
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		protocol = -1
		from_port = 0
		to_port = 0
		ipv6_cidr_blocks = ["::/0"]
	}
	vpc_id="${aws_vpc.main.id}"
	tags {
		Name = "sgExternal"
	}
}

# EC2 key pair
resource "aws_key_pair" "main" {
	key_name = "kp${var.tag_name}"
	public_key = "${file("${var.key_path}")}"
}
