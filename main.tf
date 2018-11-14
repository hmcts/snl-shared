locals {
  common_tags = {
    team_name    = "${var.team_name}"
    team_contact = "${var.team_contact}"
  }
}

// Shared Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.raw_product}-shared-infrastructure-${var.env}"
  location = "${var.location}"

  tags {
    // "Standard" CNP tags
    "environment" = "${var.env}"
    "lastUpdated" = "${timestamp()}"
    "Team Name" = "${var.team_name}"

    // Other tags
    "Team Contact" = "${var.team_contact}"
    "Destroy Me" = "${var.destroy_me}"
  }
}
