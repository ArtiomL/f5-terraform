# DigitalOcean Resources

locals {
  tags = ["Terraform", "${var.tag_environment}"]
}

provider "digitalocean" {}

resource "digitalocean_droplet" "main" {
  ssh_keys = "${var.ssh_keys}"
  image    = "${var.droplet_image}"
  region   = "${var.do_region}"
  size     = "${var.droplet_size}"
  name     = "drop${var.tag_name}${var.tag_environment}"
  tags     = "${concat(local.tags, var.tags_shared)}"
}

resource "digitalocean_floating_ip" "main" {
  droplet_id = "${digitalocean_droplet.main.id}"
  region     = "${digitalocean_droplet.main.region}"
}
