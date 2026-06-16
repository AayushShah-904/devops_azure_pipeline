variables {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  tenant_id       = "00000000-0000-0000-0000-000000000000"
  admin_password  = "M0ckP@ssw0rd!"
}

mock_provider "azurerm" {}
mock_provider "tls" {}

run "vnet_address_space_is_correct" {
  command = plan

  assert {
    condition     = contains(azurerm_virtual_network.vnet_india.address_space, "10.0.0.0/16")
    error_message = "VNet Central India address space is incorrect"
  }
}

run "subnet_address_prefixes_are_correct" {
  command = plan

  assert {
    condition     = contains(azurerm_subnet.subnet_india.address_prefixes, "10.0.0.0/24")
    error_message = "Subnet Central India address prefix is incorrect"
  }
}
