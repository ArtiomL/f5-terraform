# Internal security group
resource "aws_security_group" "int" {
	name = "sgInternal"
	description = "SSH, HTTP/S, WS and ICMP access"
	ingress {
		protocol = "tcp"
		from_port = 22
		to_port = 22
		cidr_blocks = "${var.mgmt_asrc}"
	}
	ingress {
		protocol = "tcp"
		from_port = 80
		to_port = 80
		cidr_blocks = ["${var.vpc_cidr}"]
	}
	ingress {
		protocol = "tcp"
		from_port = 443
		to_port = 443
		cidr_blocks = ["${var.vpc_cidr}"]
	}
	ingress {
		protocol = "tcp"
		from_port = 4433
		to_port = 4433
		cidr_blocks = ["${var.vpc_cidr}"]
	}
	ingress {
		protocol = "icmp"
		from_port = -1
		to_port = -1
		cidr_blocks = ["${var.vpc_cidr}"]
	}
	egress {
		protocol = -1
		from_port = 0
		to_port = 0
		cidr_blocks = ["0.0.0.0/0"]
	}
	vpc_id = "${aws_vpc.main.id}"
	tags {
		Name = "sgInternal"
	}
}

# Assign route table to internal subnet
resource "aws_route_table_association" "int" {
	subnet_id = "${aws_subnet.int.id}"
	route_table_id = "${aws_route_table.public.id}"
}
