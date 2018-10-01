module "vault" {
  source = "git@github.com:hmcts/cnp-module-key-vault.git?ref=master"
  name = "${var.raw_product}}-${var.env}"
  product = "${var.product}"
  env = "${var.env}"
  tenant_id = "${var.tenant_id}"
  object_id = "${var.jenkins_AAD_objectId}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  product_group_object_id = "70de400b-4f47-4f25-a4f0-45e1ee4e4ae3"
}

resource "random_string" "s2s_jwt_secret" {
  length = 32
  number = true
  lower = true
  upper = true
  special = true
  override_special = "/@\" "
}

resource "random_string" "frontend_jwt_secret" {
  length = 32
  number = true
  lower = true
  upper = true
  special = true
  override_special = "/@\" "
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
