locals {
  common_tags = {
    // "Standard" CNP tags
    "environment" = "${var.env}"
    "Team Name" = "${var.team_name}"

    // Other tags
    "Team Contact" = "${var.team_contact}"
    "Destroy Me" = "${var.destroy_me}"
  }
}

// Shared Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.raw_product}-shared-infrastructure-${var.env}"
  location = "${var.location}"

  tags = "${merge(local.common_tags,
    map("lastUpdated", "${timestamp()}")
  )}"
}
