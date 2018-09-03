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
	subnet {
		name = "snetMgmt"
		address_prefix = "${var.mgmt_cidr}"
	}
	subnet {
		name = "snetExternal"
		address_prefix = "${var.ext_cidr}"
	}
	subnet {
		name = "snetInternal"
		address_prefix = "${var.int_cidr}"
	}
}
