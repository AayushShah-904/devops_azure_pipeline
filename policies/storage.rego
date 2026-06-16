# ─────────────────────────────────────────────────────────────────────────────
# storage.rego  — OPA Conftest policy for Azure Storage containers
#
# RULE: Deny any storage container that is not set to private access.
#       container_access_type must be "" (empty string = private) or "private".
#       Values "blob" or "container" make contents publicly readable.
#
# WHY: Public blob access is a leading cause of data leaks in Azure.
#      All storage containers in this project should be private.
# ─────────────────────────────────────────────────────────────────────────────

package main

import rego.v1

# Deny if any storage container has non-private access
deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_storage_container"

  after := resource.change.after

  # Any value that is NOT private (empty string means private in AzureRM provider)
  not is_private_access(after.container_access_type)

  msg := sprintf(
    "POLICY VIOLATION [storage]: Storage container '%s' has container_access_type='%s'. Must be 'private' or '' (empty) to prevent public data exposure.",
    [after.name, after.container_access_type],
  )
}

# Helper: private access types in azurerm provider
is_private_access(access_type) if access_type == ""
is_private_access(access_type) if access_type == "private"
