// Resource Group Central India
output "resource_group_name" {
  description = "Name of the deployed resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.rg.location
}

// Linux Virtual Machine Central India
output "vm_india_id" {
  description = "Resource ID of the Central India Linux VM"
  value       = azurerm_linux_virtual_machine.vm_india.id
}

output "vm_india_name" {
  description = "Name of the Central India Linux VM"
  value       = azurerm_linux_virtual_machine.vm_india.name
}

output "vm_india_principal_id" {
  description = "System-assigned managed identity principal ID of the Central India VM"
  value       = azurerm_linux_virtual_machine.vm_india.identity[0].principal_id
}

// Public IP Central India
output "public_ip_india_address" {
  description = "Public IP address of the Central India VM"
  value       = azurerm_public_ip.pip_india.ip_address
}

// Network Interface Central India
output "nic_india_id" {
  description = "Resource ID of the Central India NIC"
  value       = azurerm_network_interface.nic_india.id
}

// Virtual Network and Subnet Central India
output "vnet_india_id" {
  description = "Resource ID of the Central India VNet"
  value       = azurerm_virtual_network.vnet_india.id
}

output "subnet_india_id" {
  description = "Resource ID of the Central India subnet"
  value       = azurerm_subnet.subnet_india.id
}

// Network Security Group Central India
output "nsg_india_id" {
  description = "Resource ID of the Central India NSG"
  value       = azurerm_network_security_group.nsg_india.id
}

// Key Vault Central India
output "key_vault_id" {
  description = "Resource ID of the Key Vault"
  value       = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  description = "URI of the Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}

// SSH Key Central India
output "ssh_public_key_openssh" {
  description = "Generated SSH public key (OpenSSH format)"
  value       = tls_private_key.generated.public_key_openssh
  sensitive   = true
}

// Key Vault Secret Central India
output "kv_secret_ssh_private_key_id" {
  description = "Key Vault secret resource ID for the SSH private key"
  value       = azurerm_key_vault_secret.ssh_private_key.id
}

output "kv_secret_ssh_public_key_id" {
  description = "Key Vault secret resource ID for the SSH public key"
  value       = azurerm_key_vault_secret.ssh_public_key.id
}

output "kv_secret_admin_username_id" {
  description = "Key Vault secret resource ID for the admin username"
  value       = azurerm_key_vault_secret.admin_username.id
}

output "kv_secret_admin_password_id" {
  description = "Key Vault secret resource ID for the admin recovery password"
  value       = azurerm_key_vault_secret.admin_password.id
  sensitive   = true
}

output "kv_secret_ssh_private_key_version_uri" {
  description = "Versionless URI to retrieve the SSH private key from Key Vault"
  value       = azurerm_key_vault_secret.ssh_private_key.versionless_id
}
