# Public IP Output Variables

output "ip" {
  value = "${data.external.ifconfig.result.ip}"
}

output "map" {
  value = "${data.external.ifconfig.result}"
}
