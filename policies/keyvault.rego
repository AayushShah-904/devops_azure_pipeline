# ─────────────────────────────────────────────────────────────────────────────
# keyvault.rego  — OPA Conftest policy for Azure Key Vault
#
# RULE: Deny any Key Vault with soft_delete_retention_days < 7.
#       Azure minimum is 7 days; this project uses 90 days.
#
# WHY: Soft delete protects against accidental or malicious secret deletion.
#      A retention period below 7 days offers almost no protection window.
# ─────────────────────────────────────────────────────────────────────────────

package main

import rego.v1

# Deny if soft delete retention is below the minimum threshold
deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_key_vault"

  after := resource.change.after

  # Soft delete retention is too low
  after.soft_delete_retention_days < 7

  msg := sprintf(
    "POLICY VIOLATION [keyvault]: Key Vault '%s' has soft_delete_retention_days=%d. Minimum allowed is 7 days (project standard is 90 days).",
    [after.name, after.soft_delete_retention_days],
  )
}
