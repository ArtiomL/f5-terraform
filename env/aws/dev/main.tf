# Infrastructure

provider "aws" {
  region = "${var.aws_region}"
}

# AWS network
module "aws_network" {
  source          = "github.com/ArtiomL/f5-terraform/modules/aws/network"
  aws_region      = "${var.aws_region}"
  vpc_cidr        = "${var.vpc_cidr}"
  az_names        = "${var.az_names}"
  mgmt_cidrs      = "${var.mgmt_cidrs}"
  ext_cidrs       = "${var.ext_cidrs}"
  int_cidrs       = "${var.int_cidrs}"
  tag_name        = "${var.tag_name}"
  tag_environment = "${var.tag_environment}"
  tags_shared     = "${var.tags_shared}"
}
