variables {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  tenant_id       = "00000000-0000-0000-0000-000000000000"
  admin_password  = "M0ckP@ssw0rd!"
}

mock_provider "azurerm" {}
mock_provider "tls" {}

run "keyvault_sku_and_retention_are_correct" {
  command = plan

  assert {
    condition     = azurerm_key_vault.kv.sku_name == "standard"
    error_message = "Key Vault SKU must be standard"
  }

  assert {
    condition     = azurerm_key_vault.kv.soft_delete_retention_days == 90
    error_message = "Key Vault soft delete retention period must be 90 days"
  }
}

run "keyvault_access_configuration_is_correct" {
  command = plan

  assert {
    condition     = azurerm_key_vault.kv.rbac_authorization_enabled == true
    error_message = "Key Vault must have RBAC authorization enabled"
  }
}
