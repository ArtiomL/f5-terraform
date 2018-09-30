# EC2 key pair
resource "aws_key_pair" "main" {
  key_name   = "kp${var.tag_name}${var.tag_environment}"
  public_key = "${file(var.key_path)}"
}
