variables {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  tenant_id       = "00000000-0000-0000-0000-000000000000"
  admin_password  = "M0ckP@ssw0rd!"
}

mock_provider "azurerm" {}
mock_provider "tls" {}

run "vm_size_and_username_are_correct" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.size == "Standard_B2s"
    error_message = "VM size must be Standard_B2s for student subscriptions"
  }

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.admin_username == "bharatomni"
    error_message = "VM admin username is incorrect"
  }
}

run "vm_os_disk_configuration_is_correct" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.os_disk[0].disk_size_gb == 30
    error_message = "OS disk size must be 30 GB"
  }

  assert {
    condition     = azurerm_linux_virtual_machine.vm_india.os_disk[0].storage_account_type == "StandardSSD_LRS"
    error_message = "OS disk storage type must be StandardSSD_LRS"
  }
}
