# AMI Data Source

data "aws_region" "this" {}

data "external" "ami" {
  program = ["sh", "-c", "curl -sL ${var.ami_url} | jq 'with_entries(.value |= .${var.image_name})'"]
}
