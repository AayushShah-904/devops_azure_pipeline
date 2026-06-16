# ─────────────────────────────────────────────────────────────────────────────
# networking.rego  — OPA Conftest policy for NSG security rules
#
# RULE: Deny any NSG security rule that allows unrestricted SSH (port 22)
#       from the internet (source_address_prefix = "*" or "0.0.0.0/0").
#
# WHY: Open SSH from any source is a critical attack surface.
#      A future hardening step is to lock source_address_prefix to your
#      CI runner IP range or a corporate IP.
# ─────────────────────────────────────────────────────────────────────────────

package main

import rego.v1

# Deny if an NSG security rule allows SSH (port 22) from an open source
deny contains msg if {
  # Find all azurerm_network_security_rule resources in the plan
  resource := input.resource_changes[_]
  resource.type == "azurerm_network_security_rule"

  after := resource.change.after

  # The rule allows inbound traffic
  after.access == "Allow"
  after.direction == "Inbound"

  # The rule targets port 22 (SSH)
  after.destination_port_range == "22"

  # The source is open to the internet
  open_source(after.source_address_prefix)

  msg := sprintf(
    "POLICY VIOLATION [networking]: NSG rule '%s' allows SSH (port 22) from open source '%s'. Restrict source_address_prefix to a specific IP or CIDR.",
    [after.name, after.source_address_prefix],
  )
}

# Helper: checks if the source prefix is open to the internet
open_source(prefix) if prefix == "*"
open_source(prefix) if prefix == "0.0.0.0/0"
open_source(prefix) if prefix == "Internet"
