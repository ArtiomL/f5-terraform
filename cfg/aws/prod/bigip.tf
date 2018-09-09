# https://github.com/F5Networks/f5-aws-cloudformation/tree/master/supported/failover/across-net/via-api/3nic/existing-stack/byol/
resource "aws_cloudformation_stack" "bigip" {
	name = "cf${var.tag_name}"
	template_url = "${var.bigip_cft}"
	parameters {
		Vpc = "${aws_vpc.main.id}"
		managementSubnetAz1 = "${aws_subnet.mgmt1.id}"
		managementSubnetAz2 = "${aws_subnet.mgmt2.id}"
		subnet1Az1 = "${aws_subnet.ext1.id}"
		subnet1Az2 = "${aws_subnet.ext2.id}"
		subnet2Az1 = "${aws_subnet.int1.id}"
		subnet2Az2 = "${aws_subnet.int2.id}"
		imageName = "AllTwoBootLocations"
		instanceType = "m5.xlarge"
		licenseKey1 = "${var.bigip_lic1}"
		licenseKey2 = "${var.bigip_lic2}"
		sshKey = "${aws_key_pair.main.id}"
		restrictedSrcAddress = "${var.mgmt_asrc[0]}"
		restrictedSrcAddressApp = "0.0.0.0/0"
		timezone = "Asia/Jerusalem"
		allowUsageAnalytics = "No"
	}
	capabilities = ["CAPABILITY_IAM"]
}
