# Infrastructure

provider "azurerm" {
	environment = "public"
}

# Resource group
resource "azurerm_resource_group" "main" {
	name = "rg${var.tag_name}"
	location = "${var.azure_region}"
}

# VNet
resource "azurerm_virtual_network" "main" {
	name = "vnet${var.tag_name}"
	address_space = "${var.vnet_cidr}"
	location = "${azurerm_resource_group.main.location}"
	resource_group_name = "${azurerm_resource_group.main.name}"
}

# Management subnet
resource "azurerm_subnet" "mgmt" {
	name = "snetMgmt"
	resource_group_name = "${azurerm_resource_group.main.name}"
	virtual_network_name = "${azurerm_virtual_network.main.name}"
	address_prefix = "${var.mgmt_cidr}"
}

# External subnet
resource "azurerm_subnet" "ext" {
	name = "snetExternal"
	resource_group_name = "${azurerm_resource_group.main.name}"
	virtual_network_name = "${azurerm_virtual_network.main.name}"
	address_prefix = "${var.ext_cidr}"
}

# Internal subnet
resource "azurerm_subnet" "int" {
	name = "snetInternal"
	resource_group_name = "${azurerm_resource_group.main.name}"
	virtual_network_name = "${azurerm_virtual_network.main.name}"
	address_prefix = "${var.int_cidr}"
}
