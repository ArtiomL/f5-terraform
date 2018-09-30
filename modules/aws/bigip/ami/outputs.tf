# AMI Output Variables

output "id" {
  value = "${lookup(data.external.ami.result, data.aws_region.this.name)}"
}

output "map" {
  value = "${data.external.ami.result}"
}
