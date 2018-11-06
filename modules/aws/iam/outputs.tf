# IAM Output Variables

output "ip_name" {
  value = "${aws_iam_instance_profile.main.name}"
}
