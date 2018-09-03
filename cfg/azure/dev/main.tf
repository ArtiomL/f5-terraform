# Infrastructure

provider "azurerm" {
	environment = "public"
}

# Resource group
resource "azurerm_resource_group" "rg" {
	name = "rg${var.tag_name}"
	location = "${var.azure_region}"
}
