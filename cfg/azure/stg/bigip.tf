# https://github.com/F5Networks/f5-azure-arm-templates/tree/master/supported/failover/same-net/via-api/n-nic/existing-stack/byol/
resource "azurerm_template_deployment" "bigip" {
	name = "atd${var.tag_name}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	template_body = "${replace(data.http.armt.body, "### START (INPUT) CUSTOM CONFIGURATION HERE\\n", "curl -sL https://f5labs.one/as3 | bash; tmsh modify /auth user ${var.bigip_user} password ${var.bigip_pass}")}"
	parameters {
		adminUsername = "${var.bigip_user}"
		authenticationType = "sshPublicKey"
		adminPasswordOrKey = "${file(var.key_path)}"
		dnsLabel = "${var.tag_name}"
		instanceName = "vmBIP"
		instanceType = "Standard_DS3_v2"
		imageName = "AllTwoBootLocations"
		bigIpVersion = "latest"
		licenseKey1 = "${var.bigip_lic1}"
		licenseKey2 = "${var.bigip_lic2}"
		#numberOfExternalIps = 1
		vnetName = "${azurerm_virtual_network.main.name}"
		vnetResourceGroupName = "${azurerm_resource_group.main.name}"
		mgmtSubnetName = "${azurerm_subnet.mgmt.name}"
		mgmtIpAddressRangeStart = "${replace(var.mgmt_cidr, "0/24", "245")}"
		externalSubnetName = "${azurerm_subnet.ext.name}"
		externalIpSelfAddressRangeStart = "${replace(var.ext_cidr, "0/24", "245")}"
		externalIpAddressRangeStart = "${replace(var.ext_cidr, "0/24", "10")}"
		internalSubnetName = "${azurerm_subnet.int.name}"
		internalIpAddressRangeStart = "${replace(var.int_cidr, "0/24", "245")}"
		tenantId = "${var.arm_tenant_id}"
		clientId = "${var.arm_client_id}"
		servicePrincipalSecret = "${var.arm_client_secret}"
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

# Set via TF_VAR_ environment variables
variable "arm_tenant_id" {}
variable "arm_client_id" {}
variable "arm_client_secret" {}
