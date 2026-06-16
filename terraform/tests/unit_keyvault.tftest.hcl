# ─────────────────────────────────────────────────────────────────────────────
# unit_keyvault.tftest.hcl
#
# Terraform unit tests for Key Vault resources.
#
# NOTE: The Key Vault resource in main.tf is currently commented out (wrapped
# in /* ... */) because the Azure Student subscription does not support Key
# Vault in the West US 2 region. These tests verify the VARIABLE DEFAULTS
# that would be used when Key Vault is re-enabled.
#
# These tests use mock_provider so NO real Azure API calls are made.
# ─────────────────────────────────────────────────────────────────────────────

# Mock the azurerm provider — no real Azure credentials needed
mock_provider "azurerm" {}

# Mock the tls provider
mock_provider "tls" {}

# ─── Variables needed for the module ─────────────────────────────────────────
variables {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  tenant_id       = "00000000-0000-0000-0000-000000000000"
  admin_password  = "MockP@ssw0rd123!"
}

# ─── Test: Key Vault SKU default is "standard" ────────────────────────────────
run "keyvault_sku_default_is_standard" {
  command = plan

  assert {
    condition     = var.key_vault_sku == "standard"
    error_message = "Key Vault SKU variable default must be 'standard'."
  }
}

# ─── Test: Soft delete retention is 90 days ───────────────────────────────────
run "keyvault_soft_delete_retention_is_90_days" {
  command = plan

  assert {
    condition     = var.key_vault_soft_delete_days == 90
    error_message = "Key Vault soft_delete_retention_days must be 90 to comply with data protection standards."
  }
}

# ─── Test: Soft delete retention meets minimum policy (>= 7 days) ─────────────
run "keyvault_soft_delete_retention_meets_minimum" {
  command = plan

  assert {
    condition     = var.key_vault_soft_delete_days >= 7
    error_message = "Key Vault soft_delete_retention_days must be at least 7 days (OPA policy minimum)."
  }
}

# ─── Test: Key Vault name has the expected prefix ─────────────────────────────
run "keyvault_name_has_expected_prefix" {
  command = plan

  assert {
    condition     = startswith(var.key_vault_name, "kv-")
    error_message = "Key Vault name must start with 'kv-' following the project naming convention."
  }
}
