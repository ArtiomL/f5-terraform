# https://github.com/F5Networks/f5-aws-cloudformation/tree/master/supported/standalone/3nic/existing-stack/byol
resource "aws_cloudformation_stack" "bigip" {
	name = "cf${var.tag_name}"
	template_url = "${var.bigip_cft}"
	parameters {
		Vpc = "${aws_vpc.main.id}"
		managementSubnetAz1 = "${aws_subnet.mgmt.id}"
		subnet1Az1 = "${aws_subnet.ext.id}"
		subnet2Az1 = "${aws_subnet.int.id}"
		imageName = "AllTwoBootLocations"
		instanceType = "m5.xlarge"
		licenseKey1 = "${var.bigip_lic1}"
		sshKey = "${aws_key_pair.main.id}"
		restrictedSrcAddress = "${var.mgmt_asrc[0]}"
		restrictedSrcAddressApp = "0.0.0.0/0"
		timezone = "Asia/Jerusalem"
		allowUsageAnalytics = "No"
	}
	capabilities = ["CAPABILITY_IAM"]
}
