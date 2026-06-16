package main

import rego.v1

# Deny if Azure Key Vault soft delete retention is less than 7 days
deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_key_vault"
  resource.change.after.soft_delete_retention_days < 7
  msg := sprintf("DENY: Key Vault '%s' must have at least 7 soft-delete retention days.", [resource.address])
}

# Deny if AWS KMS Key does not have rotation enabled
deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_kms_key"
  resource.change.after.enable_key_rotation != true
  msg := sprintf("DENY: AWS KMS Key '%s' must have enable_key_rotation set to true.", [resource.address])
}
