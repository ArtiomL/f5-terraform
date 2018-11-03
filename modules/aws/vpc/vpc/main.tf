# VPC Resources

locals {
  tags = {
    CreatedBy   = "Terraform"
    Environment = "${var.tag_environment}"
  }
}

resource "aws_vpc" "main" {
  cidr_block                       = "${var.cidr_block}"
  assign_generated_ipv6_cidr_block = "${var.ipv6_cidr_block}"
  enable_dns_support               = "${var.enable_dns_support}"
  enable_dns_hostnames             = "${var.enable_dns_hostnames}"

  tags = "${merge(local.tags, var.tags_shared, map(
    "Name", "vpc${var.tag_name}${var.tag_environment}"
  ))}"
}

resource "aws_internet_gateway" "main" {
  count  = "${var.create_igw ? 1 : 0}"
  vpc_id = "${aws_vpc.main.id}"

  tags = "${merge(local.tags, var.tags_shared, map(
    "Name", "igw${var.tag_name}${var.tag_environment}"
  ))}"
}
