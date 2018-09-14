# Subnet Output Variables

output "ids" {
  value = ["${aws_subnet.main.*.id}"]
}

output "sg_id" {
  value = "${aws_security_group.main.id}"
}
