# ─────────────────────────────────────────────────────────────────────────────
# unit_compute.tftest.hcl
#
# Terraform unit tests for compute resources:
#   • azurerm_linux_virtual_machine.vm_india
#
# These tests use mock_provider so NO real Azure API calls are made.
# They verify VM size, OS disk configuration, and admin credentials.
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

# ─── Test: VM uses the correct student-tier size ──────────────────────────────
run "vm_size_is_standard_b2s" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.size == "Standard_B2s"
    error_message = "VM size must be 'Standard_B2s' for Azure Student subscription compatibility."
  }
}

# ─── Test: OS disk size is 30 GB ──────────────────────────────────────────────
run "os_disk_size_is_30gb" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.os_disk[0].disk_size_gb == 30
    error_message = "OS disk size must be 30 GB as defined in variables."
  }
}

# ─── Test: OS disk type is StandardSSD_LRS ───────────────────────────────────
run "os_disk_type_is_standard_ssd" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.os_disk[0].storage_account_type == "StandardSSD_LRS"
    error_message = "OS disk type must be 'StandardSSD_LRS' for Azure Student subscription compatibility."
  }
}

# ─── Test: Admin username is correct ──────────────────────────────────────────
run "admin_username_is_bharatomni" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.admin_username == "bharatomni"
    error_message = "Admin username must be 'bharatomni' as defined in variable defaults."
  }
}

# ─── Test: VM is deployed in Central India ────────────────────────────────────
run "vm_location_is_central_india" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.location == "centralindia"
    error_message = "VM must be deployed in 'centralindia' region."
  }
}

# ─── Test: VM has SystemAssigned identity ────────────────────────────────────
run "vm_has_system_assigned_identity" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.identity[0].type == "SystemAssigned"
    error_message = "VM must have a SystemAssigned managed identity for secure Azure service access."
  }
}
