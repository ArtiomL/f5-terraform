# Subnet Resources

locals {
  tags = {
    CreatedBy   = "Terraform"
    Environment = "${var.tag_environment}"
  }
}

resource "aws_subnet" "main" {
  count             = "${length(var.az_names)}"
  vpc_id            = "${var.vpc_id}"
  availability_zone = "${element(var.az_names, count.index)}"
  cidr_block        = "${element(var.cidr_blocks, count.index)}"

  tags = "${merge(local.tags, var.tags_shared, map(
    "Name", "snet${var.tag_name}${count.index + 1}${var.tag_environment}"
  ))}"
}

resource "aws_route_table_association" "main" {
  count          = "${var.rt_associate ? length(var.az_names) : 0}"
  subnet_id      = "${element(aws_subnet.main.*.id, count.index)}"
  route_table_id = "${var.route_table_id}"
}

resource "aws_security_group" "main" {
  name        = "sg${var.tag_name}${var.tag_environment}"
  description = "${var.tag_name} security group"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(local.tags, var.tags_shared, map(
    "Name", "sg${var.tag_name}${var.tag_environment}"
 ))}"
}
