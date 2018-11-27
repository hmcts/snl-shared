module "vault" {
  source = "git@github.com:hmcts/cnp-module-key-vault.git?ref=master"
  name = "${var.product}-${var.env}"
  product = "${var.product}"
  env = "${var.env}"
  tenant_id = "${var.tenant_id}"
  object_id = "${var.jenkins_AAD_objectId}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  product_group_object_id = "${var.product_group_object_id}"
}

resource "random_string" "s2s_jwt_secret" {
  length = 32
  number = true
  lower = true
  upper = true
  special = false
}

resource "random_string" "frontend_jwt_secret" {
  length = 32
  number = true
  lower = true
  upper = true
  special = false
}

resource "azurerm_key_vault_secret" "s2s_jwt_secret" {
  name      = "s2s-jwt-secret"
  value     = "${random_string.s2s_jwt_secret.result}"
  vault_uri = "${module.vault.key_vault_uri}"
}

resource "azurerm_key_vault_secret" "frontend_jwt_secret" {
  name      = "frontend-jwt-secret"
  value     = "${random_string.frontend_jwt_secret.result}"
  vault_uri = "${module.vault.key_vault_uri}"
}
