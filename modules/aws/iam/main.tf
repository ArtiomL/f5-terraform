# IAM Resources

resource "aws_iam_role" "main" {
  name               = "iamr${var.tag_name}${var.tag_environment}"
  path               = "${var.path}"
  assume_role_policy = "${var.assume_role_policy}"
}

resource "aws_iam_role_policy" "main" {
  name   = "iamrp${var.tag_name}${var.tag_environment}"
  role   = "${aws_iam_role.main.name}"
  policy = "${var.policy}"
}

resource "aws_iam_instance_profile" "main" {
  name = "iamip${var.tag_name}${var.tag_environment}"
  path = "${var.path}"
  role = "${aws_iam_role.main.name}"
}
