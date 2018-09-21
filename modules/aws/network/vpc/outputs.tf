# VPC Output Variables

output "id" {
	value = "${aws_vpc.main.id}"
}

output "igw_id" {
	value = "${element(concat(aws_internet_gateway.main.*.id, list("")), 0)}"
}
