resource "azurerm_resource_group" "backend_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = azurerm_resource_group.backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = true # Enable versioning to keep history of state files
  }

  tags = {
    purpose = "terraform-remote-state"
  }
}

resource "azurerm_storage_container" "backend_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.backend_sa.name
  container_access_type = "private"
}
