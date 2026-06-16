# ─────────────────────────────────────────────────────────────────────────────
# unit_networking.tftest.hcl
#
# Terraform unit tests for networking resources:
#   • azurerm_virtual_network.vnet_india
#   • azurerm_subnet.subnet_india
#   • azurerm_network_security_group.nsg_india
#
# These tests use mock_provider so NO real Azure API calls are made.
# They verify configuration values and resource structure only.
# ─────────────────────────────────────────────────────────────────────────────

# Mock the azurerm provider — no real Azure credentials needed
mock_provider "azurerm" {}

# Mock the tls provider (used for SSH key generation)
mock_provider "tls" {}

# ─── Variables needed for the module ─────────────────────────────────────────
variables {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  tenant_id       = "00000000-0000-0000-0000-000000000000"
  admin_password  = "MockP@ssw0rd123!"
}

# ─── Test: VNet address space is correct ─────────────────────────────────────
run "vnet_address_space_is_correct" {
  command = plan

  assert {
    # address_space is set(string) — use contains() to avoid type mismatch with tuple
    condition     = contains(azurerm_virtual_network.vnet_india.address_space, "10.0.0.0/16")
    error_message = "VNet address space must contain '10.0.0.0/16' to match the defined network topology."
  }
}

# ─── Test: VNet is deployed to the correct region ────────────────────────────
run "vnet_location_is_central_india" {
  command = plan

  assert {
    condition     = azurerm_virtual_network.vnet_india.location == "centralindia"
    error_message = "VNet must be deployed to 'centralindia' region."
  }
}

# ─── Test: Subnet address prefix is correct ───────────────────────────────────
run "subnet_address_prefix_is_correct" {
  command = plan

  assert {
    # address_prefixes is set(string) — use contains() to avoid type mismatch with tuple
    condition     = contains(azurerm_subnet.subnet_india.address_prefixes, "10.0.0.0/24")
    error_message = "Subnet address prefix must contain '10.0.0.0/24'."
  }
}

# ─── Test: NSG is deployed in Central India ───────────────────────────────────
run "nsg_location_is_central_india" {
  command = plan

  assert {
    condition     = azurerm_network_security_group.nsg_india.location == "centralindia"
    error_message = "NSG must be in 'centralindia' region."
  }
}

# ─── Test: SSH NSG rule targets port 22 ──────────────────────────────────────
run "nsg_ssh_rule_targets_port_22" {
  command = plan

  assert {
    condition     = azurerm_network_security_rule.ssh_india.destination_port_range == "22"
    error_message = "SSH NSG rule must target destination port 22."
  }
}

# ─── Test: SSH NSG rule is Inbound ────────────────────────────────────────────
run "nsg_ssh_rule_is_inbound" {
  command = plan

  assert {
    condition     = azurerm_network_security_rule.ssh_india.direction == "Inbound"
    error_message = "SSH NSG rule direction must be 'Inbound'."
  }
}
