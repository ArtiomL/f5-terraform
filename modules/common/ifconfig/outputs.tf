# Public IP Output Variables

output "ip" {
  value = "${data.external.ifconfig.result.ip}"
}

output "ip_cidr" {
  value = "${data.external.ifconfig.result.ip}/32"
}

output "map" {
  value = "${data.external.ifconfig.result}"
}
