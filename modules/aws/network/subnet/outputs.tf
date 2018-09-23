# Subnet Output Variables

output "ids" {
  value = ["${aws_subnet.main.*.id}"]
}
