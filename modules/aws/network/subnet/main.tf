# Subnet Resources

locals {
	tags = {
		CreatedBy = "Terraform"
		Environment = "${var.tag_environment}"
	}
}

resource "aws_subnet" "main" {
	count = "${length(var.az_names)}"
	vpc_id = "${var.vpc_id}"
	availability_zone = "${element(var.az_names, count.index)}"
	cidr_block = "${element(var.cidr_blocks, count.index)}"
	tags = "${merge(local.tags, var.tags_shared, map(
		"Name", "snet${var.tag_name}${count.index + 1}${var.tag_environment}"
	))}"
}
