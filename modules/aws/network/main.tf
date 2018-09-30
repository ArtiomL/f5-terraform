# Network Resources

provider "aws" {
  region = "${var.aws_region}"
}

# VPC
module "vpc" {
  source          = "./vpc"
  cidr_block      = "${var.vpc_cidr}"
  tag_name        = "${var.tag_name}"
  tag_environment = "${var.tag_environment}"
  tags_shared     = "${var.tags_shared}"
}

# Public route table
module "route" {
  source          = "./route"
  vpc_id          = "${module.vpc.id}"
  gateway_id      = "${module.vpc.igw_id}"
  tag_name        = "Public"
  tag_environment = "${var.tag_environment}"
  tags_shared     = "${var.tags_shared}"
}

# Management subnets
module "subnet_mgmt" {
  source          = "./subnet"
  vpc_id          = "${module.vpc.id}"
  az_names        = "${var.az_names}"
  cidr_blocks     = "${var.mgmt_cidrs}"
  route_table_id  = "${module.route.id}"
  tag_name        = "Mgmt"
  tag_environment = "${var.tag_environment}"
  tags_shared     = "${var.tags_shared}"
}

# External subnets
module "subnet_ext" {
  source          = "./subnet"
  vpc_id          = "${module.vpc.id}"
  az_names        = "${var.az_names}"
  cidr_blocks     = "${var.ext_cidrs}"
  route_table_id  = "${module.route.id}"
  tag_name        = "External"
  tag_environment = "${var.tag_environment}"
  tags_shared     = "${var.tags_shared}"
}

# Internal subnets
module "subnet_int" {
  source          = "./subnet"
  vpc_id          = "${module.vpc.id}"
  az_names        = "${var.az_names}"
  cidr_blocks     = "${var.int_cidrs}"
  rt_associate    = "false"
  tag_name        = "Internal"
  tag_environment = "${var.tag_environment}"
  tags_shared     = "${var.tags_shared}"
}
