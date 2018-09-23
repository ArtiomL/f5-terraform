# Route Table Resources

locals {
  tags = {
    CreatedBy   = "Terraform"
    Environment = "${var.tag_environment}"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${var.vpc_id}"
  tags   = "${merge(local.tags, var.tags_shared, map(
    "Name", "rt${var.tag_name}${var.tag_environment}"
  ))}"
}

resource "aws_route" "main" {
  route_table_id         = "${aws_route_table.main.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${var.gateway_id}"
}
