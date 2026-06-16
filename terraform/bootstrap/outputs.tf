output "resource_group_name" {
  description = "The name of the resource group created for the state backend"
  value       = azurerm_resource_group.backend_rg.name
}

output "storage_account_name" {
  description = "The name of the storage account created for the state backend"
  value       = azurerm_storage_account.backend_sa.name
}

output "container_name" {
  description = "The name of the container created for the state backend"
  value       = azurerm_storage_container.backend_container.name
}
