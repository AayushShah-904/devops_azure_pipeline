// Client Config Central India
data "azurerm_client_config" "current" {}

// Private Key Central India
resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Resource Group Central India
resource "azurerm_resource_group" "rg" {
  location = var.location_centralindia
  name     = var.resource_group_name
  tags     = {}
}

// SSH Public Key Central India
resource "azurerm_ssh_public_key" "ssh_key_india" {
  location            = var.location_centralindia
  name                = var.ssh_public_key_india_resource_name
  public_key          = tls_private_key.generated.public_key_openssh
  resource_group_name = azurerm_resource_group.rg.name
  tags                = {}
}

// Virtual Network Central India
resource "azurerm_virtual_network" "vnet_india" {
  address_space       = var.vnet_address_space
  location            = var.location_centralindia
  name                = var.vnet_india_name
  resource_group_name = azurerm_resource_group.rg.name
  tags                = {}
}

// Subnet Central India
resource "azurerm_subnet" "subnet_india" {
  address_prefixes                              = var.subnet_address_prefixes
  default_outbound_access_enabled               = true
  name                                          = "default"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.rg.name
  virtual_network_name                          = azurerm_virtual_network.vnet_india.name
}

// Public IP Central India
resource "azurerm_public_ip" "pip_india" {
  allocation_method       = "Static"
  idle_timeout_in_minutes = 4
  ip_version              = "IPv4"
  location                = var.location_centralindia
  name                    = var.public_ip_india_name
  resource_group_name     = azurerm_resource_group.rg.name
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
}

// Network Security Group Central India
resource "azurerm_network_security_group" "nsg_india" {
  location            = var.location_centralindia
  name                = var.nsg_india_name
  resource_group_name = azurerm_resource_group.rg.name
  tags                = {}
}

resource "azurerm_network_security_rule" "ssh_india" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "22"
  direction                   = "Inbound"
  name                        = "SSH"
  network_security_group_name = azurerm_network_security_group.nsg_india.name
  priority                    = 300
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "https_india" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Inbound"
  name                        = "HTTPS"
  network_security_group_name = azurerm_network_security_group.nsg_india.name
  priority                    = 320
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "http_india" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  direction                   = "Inbound"
  name                        = "HTTP"
  network_security_group_name = azurerm_network_security_group.nsg_india.name
  priority                    = 340
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "client_portal_india" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "5173"
  direction                   = "Inbound"
  name                        = "client-portal-app"
  network_security_group_name = azurerm_network_security_group.nsg_india.name
  priority                    = 360
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "service_provider_india" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "8080"
  direction                   = "Inbound"
  name                        = "service-provider-platform"
  network_security_group_name = azurerm_network_security_group.nsg_india.name
  priority                    = 350
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "admin_portal_india" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "8081"
  direction                   = "Inbound"
  name                        = "admin-portal"
  network_security_group_name = azurerm_network_security_group.nsg_india.name
  priority                    = 370
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "admin_portal_ui_india" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "8181"
  direction                   = "Inbound"
  name                        = "admin-portal-ui"
  network_security_group_name = azurerm_network_security_group.nsg_india.name
  priority                    = 380
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

// Network Interface Central India
resource "azurerm_network_interface" "nic_india" {
  accelerated_networking_enabled = false
  location                       = var.location_centralindia
  name                           = var.nic_india_name
  resource_group_name            = azurerm_resource_group.rg.name
  tags                           = {}

  ip_configuration {
    name                          = "ipconfig1"
    primary                       = true
    private_ip_address_allocation = "Dynamic"
    private_ip_address_version    = "IPv4"
    public_ip_address_id          = azurerm_public_ip.pip_india.id
    subnet_id                     = azurerm_subnet.subnet_india.id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_india_nsg" {
  network_interface_id      = azurerm_network_interface.nic_india.id
  network_security_group_id = azurerm_network_security_group.nsg_india.id
}

// Key Vault Central India
resource "azurerm_key_vault" "kv" {
  rbac_authorization_enabled      = true
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  location                        = var.location_centralindia
  name                            = var.key_vault_name
  public_network_access_enabled   = true
  purge_protection_enabled        = false
  resource_group_name             = azurerm_resource_group.rg.name
  sku_name                        = var.key_vault_sku
  soft_delete_retention_days      = var.key_vault_soft_delete_days
  tags                            = {}
  tenant_id                       = var.tenant_id

  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow"
  }
}

resource "azurerm_role_assignment" "kv_secrets_officer" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_secret" "ssh_private_key" {
  name         = "ssh-private-key"
  value        = tls_private_key.generated.private_key_pem
  key_vault_id = azurerm_key_vault.kv.id
  content_type = "text/plain"
  tags         = { purpose = "vm-ssh-access" }
  depends_on   = [azurerm_role_assignment.kv_secrets_officer]
}

resource "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "ssh-public-key"
  value        = tls_private_key.generated.public_key_openssh
  key_vault_id = azurerm_key_vault.kv.id
  content_type = "text/plain"
  tags         = { purpose = "vm-ssh-access" }
  depends_on   = [azurerm_role_assignment.kv_secrets_officer]
}

resource "azurerm_key_vault_secret" "admin_username" {
  name         = "admin-username"
  value        = var.admin_username
  key_vault_id = azurerm_key_vault.kv.id
  content_type = "text/plain"
  tags         = { purpose = "vm-recovery-credentials" }
  depends_on   = [azurerm_role_assignment.kv_secrets_officer]
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.kv.id
  content_type = "text/plain"
  tags         = { purpose = "vm-recovery-credentials" }
  depends_on   = [azurerm_role_assignment.kv_secrets_officer]
}

// Linux Virtual Machine Central India
resource "azurerm_linux_virtual_machine" "vm_india" {
  admin_username                  = var.admin_username
  allow_extension_operations      = true
  computer_name                   = var.vm_india_computer_name
  disable_password_authentication = true
  disk_controller_type            = "SCSI"
  extensions_time_budget          = "PT1H30M"
  location                        = var.location_centralindia
  name                            = var.vm_india_name
  network_interface_ids           = [azurerm_network_interface.nic_india.id]
  patch_assessment_mode           = "ImageDefault"
  patch_mode                      = "ImageDefault"
  priority                        = "Regular"
  provision_vm_agent              = true
  resource_group_name             = azurerm_resource_group.rg.name
  secure_boot_enabled             = true
  size                            = var.vm_size
  tags                            = {}
  vtpm_enabled                    = true

  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }

  admin_ssh_key {
    public_key = azurerm_ssh_public_key.ssh_key_india.public_key
    username   = var.admin_username
  }

  boot_diagnostics {}

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    disk_size_gb         = var.os_disk_size_gb
    name                 = var.vm_india_os_disk_name
    storage_account_type = var.os_disk_storage_type
  }

  source_image_reference {
    offer     = var.image_offer
    publisher = var.image_publisher
    sku       = var.image_sku
    version   = var.image_version
  }

  depends_on = [
    azurerm_network_interface_security_group_association.nic_india_nsg,
  ]
}
