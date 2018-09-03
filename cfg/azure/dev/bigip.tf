# f5-existing-stack-byol-3nic-bigip
resource "azurerm_template_deployment" "bigip" {
	name = "atd${var.tag_name}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	template_body = "${replace(data.http.armt.body, "### START (INPUT) CUSTOM CONFIGURATION HERE\\n", "curl -sL https://f5labs.one/as3 | bash")}"
	parameters {
		adminUsername = "${var.bigip_user}"
		authenticationType = "sshPublicKey"
		adminPasswordOrKey = "${file(var.key_path)}"
		dnsLabel = "big-ip-a"
		instanceName = "vmBIP-A"
		instanceType = "Standard_DS3_v2"
		imageName = "AllTwoBootLocations"
		bigIpVersion = "latest"
		licenseKey1 = "${var.bigip_lic1}"
		#numberOfExternalIps = 1
		vnetName = "${azurerm_virtual_network.main.name}"
		vnetResourceGroupName = "${azurerm_resource_group.main.name}"
		mgmtSubnetName = "${azurerm_subnet.mgmt.name}"
		mgmtIpAddress = "${replace(var.mgmt_cidr, "0/24", "245")}"
		externalSubnetName = "${azurerm_subnet.ext.name}"
		externalIpAddressRangeStart = "${replace(var.ext_cidr, "0/24", "10")}"
		internalSubnetName = "${azurerm_subnet.int.name}"
		internalIpAddress = "${replace(var.int_cidr, "0/24", "245")}"
		timeZone = "Asia/Jerusalem"
		restrictedSrcAddress = "${var.mgmt_asrc[0]}"
		allowUsageAnalytics = "No"
	}
	deployment_mode = "Incremental"
}

data "http" "armt" {
	url = "${var.bigip_armt}"
	request_headers {
		"Accept" = "application/json"
	}
}
