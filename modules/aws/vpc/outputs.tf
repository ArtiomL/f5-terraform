# Network Output Variables

output "vpc_id" {
  value = "${module.vpc.id}"
}

output "subnet_mgmt_ids" {
  value = "${module.subnet_mgmt.ids}"
}

output "subnet_mgmt_sg_id" {
  value = "${module.subnet_mgmt.sg_id}"
}

output "subnet_ext_ids" {
  value = "${module.subnet_ext.ids}"
}

output "subnet_ext_sg_id" {
  value = "${module.subnet_ext.sg_id}"
}

output "subnet_int_ids" {
  value = "${module.subnet_int.ids}"
}

output "subnet_int_sg_id" {
  value = "${module.subnet_int.sg_id}"
}
