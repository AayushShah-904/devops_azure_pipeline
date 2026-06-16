terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.66.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = "westus2"
  managed_by = ""
  name       = "NetworkWatcherRG"
  tags       = {}
}
resource "azurerm_ssh_public_key" "res-1" {
  location            = "westus2"
  name                = "bo-platform-vm_key"
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDV8gUdgmkbS276dQIV+WEnl9B8daQXJ1Bj6g0ePphVUg5K04vHmY5n7luUyszcwTr3Xw7plKH8w8KNe+/IL6adW2btCkLTNtsD4xA2xj08YmkAfy1QQTYj12rllxcn+bbsp+WNcbXr5hE4f5AsmeiwSPOdoVqRrj0d+qdAZAcGWOTDvRf+z1goovYX/P+qqqqxct/zU+W0RghMNMWYnupS02JWNV6zCUwT0iDpNOys0FHE5/0VSHf9XcPPLAMZ7S/9CUo7zYqvS/1gNPbDZwo89Ns31Mj+OSS5NEcbdpUxxOGgVXrCgT9WQ6DIux21oYMsJuWAgxt2GDrDLeNXuX68oO8SdZndL4y+bkwmN/O6b6btQa3p43+c2lgOMWTgavPJY0U0ERoDAk0qx+bh8sAFb+T7jmcABkiIOUiV8A6hOhCyW6mkNUQMxlu2zzP2AiEDYeDXNOxQbnPqcAopfHVIeD53T47xQMCM6ClBpt7M2TDHcJ/F6tJWUEGx3TN8I9E= generated-by-azure"
  resource_group_name = azurerm_resource_group.res-0.name
  tags                = {}
}
resource "azurerm_linux_virtual_machine" "res-2" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "bharatomni"
  allow_extension_operations                             = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "bo-platform-vm"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disable_password_authentication                        = true
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  license_type                                           = ""
  location                                               = "westus2"
  max_bid_price                                          = -1
  name                                                   = "bo-platform-vm"
  network_interface_ids                                  = [azurerm_network_interface.res-9.id]
  os_managed_disk_id                                     = "/subscriptions/06c83a79-f46e-4011-b91f-68c8ce6cc6a5/resourceGroups/NetworkWatcherRG/providers/Microsoft.Compute/disks/bo-platform-vm_disk1_fe2d2a4cd1df40b4823d7f475fc31fd2"
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = true
  size                                                   = "Standard_D2s_v3"
  source_image_id                                        = ""
  tags                                                   = {}
  user_data                                              = ""
  virtual_machine_scale_set_id                           = ""
  vm_agent_platform_updates_enabled                      = false
  vtpm_enabled                                           = true
  zone                                                   = "2"
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  admin_ssh_key {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDV8gUdgmkbS276dQIV+WEnl9B8daQXJ1Bj6g0ePphVUg5K04vHmY5n7luUyszcwTr3Xw7plKH8w8KNe+/IL6adW2btCkLTNtsD4xA2xj08YmkAfy1QQTYj12rllxcn+bbsp+WNcbXr5hE4f5AsmeiwSPOdoVqRrj0d+qdAZAcGWOTDvRf+z1goovYX/P+qqqqxct/zU+W0RghMNMWYnupS02JWNV6zCUwT0iDpNOys0FHE5/0VSHf9XcPPLAMZ7S/9CUo7zYqvS/1gNPbDZwo89Ns31Mj+OSS5NEcbdpUxxOGgVXrCgT9WQ6DIux21oYMsJuWAgxt2GDrDLeNXuX68oO8SdZndL4y+bkwmN/O6b6btQa3p43+c2lgOMWTgavPJY0U0ERoDAk0qx+bh8sAFb+T7jmcABkiIOUiV8A6hOhCyW6mkNUQMxlu2zzP2AiEDYeDXNOxQbnPqcAopfHVIeD53T47xQMCM6ClBpt7M2TDHcJ/F6tJWUEGx3TN8I9E= generated-by-azure"
    username   = "bharatomni"
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 30
    name                             = "bo-platform-vm_disk1_fe2d2a4cd1df40b4823d7f475fc31fd2"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "ubuntu-24_04-lts"
    publisher = "canonical"
    sku       = "server"
    version   = "latest"
  }
}
resource "azurerm_linux_virtual_machine" "res-3" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "bharatomni"
  allow_extension_operations                             = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "bo-platform-vm-india"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disable_password_authentication                        = true
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  license_type                                           = ""
  location                                               = "centralindia"
  max_bid_price                                          = -1
  name                                                   = "bo-platform-vm-india"
  network_interface_ids                                  = [azurerm_network_interface.res-7.id]
  os_managed_disk_id                                     = "/subscriptions/06c83a79-f46e-4011-b91f-68c8ce6cc6a5/resourceGroups/NetworkWatcherRG/providers/Microsoft.Compute/disks/bo-platform-vm-india_disk1_2e69963a153b4c1dafc4edf6ce4289bc"
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = true
  size                                                   = "Standard_D2s_v3"
  source_image_id                                        = ""
  tags                                                   = {}
  user_data                                              = ""
  virtual_machine_scale_set_id                           = ""
  vm_agent_platform_updates_enabled                      = false
  vtpm_enabled                                           = true
  zone                                                   = "1"
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  admin_ssh_key {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDV8gUdgmkbS276dQIV+WEnl9B8daQXJ1Bj6g0ePphVUg5K04vHmY5n7luUyszcwTr3Xw7plKH8w8KNe+/IL6adW2btCkLTNtsD4xA2xj08YmkAfy1QQTYj12rllxcn+bbsp+WNcbXr5hE4f5AsmeiwSPOdoVqRrj0d+qdAZAcGWOTDvRf+z1goovYX/P+qqqqxct/zU+W0RghMNMWYnupS02JWNV6zCUwT0iDpNOys0FHE5/0VSHf9XcPPLAMZ7S/9CUo7zYqvS/1gNPbDZwo89Ns31Mj+OSS5NEcbdpUxxOGgVXrCgT9WQ6DIux21oYMsJuWAgxt2GDrDLeNXuX68oO8SdZndL4y+bkwmN/O6b6btQa3p43+c2lgOMWTgavPJY0U0ERoDAk0qx+bh8sAFb+T7jmcABkiIOUiV8A6hOhCyW6mkNUQMxlu2zzP2AiEDYeDXNOxQbnPqcAopfHVIeD53T47xQMCM6ClBpt7M2TDHcJ/F6tJWUEGx3TN8I9E= generated-by-azure"
    username   = "bharatomni"
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 30
    name                             = "bo-platform-vm-india_disk1_2e69963a153b4c1dafc4edf6ce4289bc"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "ubuntu-24_04-lts"
    publisher = "canonical"
    sku       = "server"
    version   = "latest"
  }
}
resource "azurerm_virtual_machine_extension" "res-4" {
  auto_upgrade_minor_version  = true
  automatic_upgrade_enabled   = false
  failure_suppression_enabled = false
  name                        = "AADSSHLoginForLinux"
  protected_settings          = "" # Masked sensitive attribute
  provision_after_extensions  = []
  publisher                   = "Microsoft.Azure.ActiveDirectory"
  tags                        = {}
  type                        = "AADSSHLoginForLinux"
  type_handler_version        = "1.0"
  virtual_machine_id          = azurerm_linux_virtual_machine.res-3.id
}
resource "azurerm_virtual_machine_extension" "res-5" {
  auto_upgrade_minor_version  = true
  automatic_upgrade_enabled   = false
  failure_suppression_enabled = false
  name                        = "enablevmAccess"
  protected_settings          = "" # Masked sensitive attribute
  provision_after_extensions  = []
  publisher                   = "Microsoft.OSTCExtensions"
  tags                        = {}
  type                        = "VMAccessForLinux"
  type_handler_version        = "1.5"
  virtual_machine_id          = azurerm_linux_virtual_machine.res-3.id
}
resource "azurerm_key_vault" "res-6" {
  access_policy                   = []
  enable_rbac_authorization       = true
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  location                        = "westus2"
  name                            = "kv-bo-platform"
  public_network_access_enabled   = true
  purge_protection_enabled        = false
  rbac_authorization_enabled      = true
  resource_group_name             = azurerm_resource_group.res-0.name
  sku_name                        = "standard"
  soft_delete_retention_days      = 90
  tags                            = {}
  tenant_id                       = "e3a4cbad-dc44-4d51-9a85-b9a62d3cfc94"
  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Allow"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }
}
resource "azurerm_network_interface" "res-7" {
  accelerated_networking_enabled = true
  auxiliary_mode                 = ""
  auxiliary_sku                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  internal_dns_name_label        = ""
  ip_forwarding_enabled          = false
  location                       = "centralindia"
  name                           = "bo-platform-vm-india632_z1"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = ""
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.0.4"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-28.id
    subnet_id                                          = azurerm_subnet.res-31.id
  }
}
resource "azurerm_network_interface_security_group_association" "res-8" {
  network_interface_id      = azurerm_network_interface.res-7.id
  network_security_group_id = azurerm_network_security_group.res-11.id
}
resource "azurerm_network_interface" "res-9" {
  accelerated_networking_enabled = true
  auxiliary_mode                 = ""
  auxiliary_sku                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  internal_dns_name_label        = ""
  ip_forwarding_enabled          = false
  location                       = "westus2"
  name                           = "bo-platform-vm127_z2"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = ""
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.0.4"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-29.id
    subnet_id                                          = azurerm_subnet.res-33.id
  }
}
resource "azurerm_network_interface_security_group_association" "res-10" {
  network_interface_id      = azurerm_network_interface.res-9.id
  network_security_group_id = azurerm_network_security_group.res-22.id
}
resource "azurerm_network_security_group" "res-11" {
  location            = "centralindia"
  name                = "bo-platform-vm-india-nsg"
  resource_group_name = azurerm_resource_group.res-0.name
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "SSH"
    priority                                   = 300
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "443"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTPS"
    priority                                   = 320
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "5173"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "client-portal-app"
    priority                                   = 360
    protocol                                   = "*"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "80"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTP"
    priority                                   = 340
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "8080"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "service-provider-platform"
    priority                                   = 350
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "8081"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "admin-portal"
    priority                                   = 370
    protocol                                   = "*"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "8181"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "admin-portal-ui"
    priority                                   = 380
    protocol                                   = "*"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_rule" "res-12" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "80"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "HTTP"
  network_security_group_name                = "bo-platform-vm-india-nsg"
  priority                                   = 340
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_rule" "res-13" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "443"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "HTTPS"
  network_security_group_name                = "bo-platform-vm-india-nsg"
  priority                                   = 320
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_rule" "res-14" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "22"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "SSH"
  network_security_group_name                = "bo-platform-vm-india-nsg"
  priority                                   = 300
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_rule" "res-15" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "8081"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "admin-portal"
  network_security_group_name                = "bo-platform-vm-india-nsg"
  priority                                   = 370
  protocol                                   = "*"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_rule" "res-16" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "8181"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "admin-portal-ui"
  network_security_group_name                = "bo-platform-vm-india-nsg"
  priority                                   = 380
  protocol                                   = "*"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_rule" "res-17" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "5173"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "client-portal-app"
  network_security_group_name                = "bo-platform-vm-india-nsg"
  priority                                   = 360
  protocol                                   = "*"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_rule" "res-18" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "8080"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "service-provider-platform"
  network_security_group_name                = "bo-platform-vm-india-nsg"
  priority                                   = 350
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-11,
  ]
}
resource "azurerm_network_security_group" "res-19" {
  location            = "westus2"
  name                = "bo-platform-vm-nsg"
  resource_group_name = azurerm_resource_group.res-0.name
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "SSH"
    priority                                   = 300
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "443"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTPS"
    priority                                   = 320
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_rule" "res-20" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "443"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "HTTPS"
  network_security_group_name                = "bo-platform-vm-nsg"
  priority                                   = 320
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-19,
  ]
}
resource "azurerm_network_security_rule" "res-21" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "22"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "SSH"
  network_security_group_name                = "bo-platform-vm-nsg"
  priority                                   = 300
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-19,
  ]
}
resource "azurerm_network_security_group" "res-22" {
  location            = "westus2"
  name                = "boplatformvmnsg814"
  resource_group_name = azurerm_resource_group.res-0.name
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "SSH"
    priority                                   = 300
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "443"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTPS"
    priority                                   = 320
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "5173"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "client-portal-http"
    priority                                   = 330
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_rule" "res-23" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "443"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "HTTPS"
  network_security_group_name                = "boplatformvmnsg814"
  priority                                   = 320
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-22,
  ]
}
resource "azurerm_network_security_rule" "res-24" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "22"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "SSH"
  network_security_group_name                = "boplatformvmnsg814"
  priority                                   = 300
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-22,
  ]
}
resource "azurerm_network_security_rule" "res-25" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "5173"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "client-portal-http"
  network_security_group_name                = "boplatformvmnsg814"
  priority                                   = 330
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-22,
  ]
}
resource "azurerm_network_watcher" "res-26" {
  location            = "centralindia"
  name                = "NetworkWatcher_centralindia"
  resource_group_name = azurerm_resource_group.res-0.name
  tags                = {}
}
resource "azurerm_network_watcher" "res-27" {
  location            = "westus2"
  name                = "NetworkWatcher_westus2"
  resource_group_name = azurerm_resource_group.res-0.name
  tags                = {}
}
resource "azurerm_public_ip" "res-28" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  edge_zone               = ""
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "centralindia"
  name                    = "bo-platform-vm-india-ip"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = ["1"]
}
resource "azurerm_public_ip" "res-29" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  edge_zone               = ""
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westus2"
  name                    = "bo-platform-vm-ip"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = ["2"]
}
resource "azurerm_virtual_network" "res-30" {
  address_space                  = ["10.0.0.0/16"]
  bgp_community                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  flow_timeout_in_minutes        = 0
  location                       = "centralindia"
  name                           = "bo-platform-vm-india-vnet"
  private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = azurerm_resource_group.res-0.name
  subnet = [{
    address_prefixes                              = ["10.0.0.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/06c83a79-f46e-4011-b91f-68c8ce6cc6a5/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/virtualNetworks/bo-platform-vm-india-vnet/subnets/default"
    name                                          = "default"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
  }]
  tags = {}
}
resource "azurerm_subnet" "res-31" {
  address_prefixes                              = ["10.0.0.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "default"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = ""
  virtual_network_name                          = "bo-platform-vm-india-vnet"
  depends_on = [
    azurerm_virtual_network.res-30,
  ]
}
resource "azurerm_virtual_network" "res-32" {
  address_space                  = ["10.0.0.0/16"]
  bgp_community                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  flow_timeout_in_minutes        = 0
  location                       = "westus2"
  name                           = "bo-platform-vm-vnet"
  private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = azurerm_resource_group.res-0.name
  subnet = [{
    address_prefixes                              = ["10.0.0.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = "/subscriptions/06c83a79-f46e-4011-b91f-68c8ce6cc6a5/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/virtualNetworks/bo-platform-vm-vnet/subnets/default"
    name                                          = "default"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
  }]
  tags = {}
}
resource "azurerm_subnet" "res-33" {
  address_prefixes                              = ["10.0.0.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "default"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = ""
  virtual_network_name                          = "bo-platform-vm-vnet"
  depends_on = [
    azurerm_virtual_network.res-32,
  ]
}
