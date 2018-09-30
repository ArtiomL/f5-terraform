# BIG-IP Resources

module "ifconfig" {
  source = "github.com/ArtiomL/f5-terraform/modules/common/ifconfig"
}

module "ami" {
  source     = "./ami"
  ami_url    = "${var.ami_url}"
  image_name = "${var.image_name}"
}
