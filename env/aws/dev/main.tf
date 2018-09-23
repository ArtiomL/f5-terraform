# Infrastructure

provider "aws" {
  region = "${var.aws_region}"
}

# AWS Network
module "aws_network" {
  source          = "github.com/ArtiomL/f5-terraform/modules/aws/network"
  aws_region      = "${var.aws_region}"
  vpc_cidr        = "${var.vpc_cidr}"
  mgmt1_cidr      = "${var.mgmt_cidr}"
  ext1_cidr       = "${var.ext_cidr}"
  int1_cidr       = "${var.int_cidr}"
  mgmt2_cidr      = ""
  ext2_cidr       = ""
  int2_cidr       = ""
  tag_name        = "${var.tag_name}"
  tag_environment = "${var.tag_environment}"
  tag_owner       = "${var.tag_owner}"
  tag_bu          = "${var.tag_bu}"
  tag_costcenter  = "${var.tag_costcenter}"
  tag_project     = "${var.tag_project}"
}
