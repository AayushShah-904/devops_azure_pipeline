// Subscription and Tenant Variables Central India
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}

// Resource Group Variables Central India
variable "resource_group_name" {
  description = "Name of the shared resource group"
  type        = string
  default     = "bo-sandbox-rg-tf"
}

// Location Variables Central India
variable "location_westus2" {
  description = "Primary Azure region (West US 2)"
  type        = string
  default     = "westus2"
}

variable "location_centralindia" {
  description = "Secondary Azure region (Central India)"
  type        = string
  default     = "centralindia"
}

// Admin Credentials Variables Central India
variable "admin_username" {
  description = "Administrator username for all Linux VMs"
  type        = string
  default     = "bharatomni"
}

variable "admin_password" {
  description = "Recovery password for all Linux VMs (stored in Key Vault). Must meet Azure complexity rules."
  type        = string
  sensitive   = true
}

// Virtual Machine Variables Central India
variable "vm_size" {
  description = "VM SKU size for both Linux VMs. Standard_B2s is used for Azure Student subscriptions. Upgrade to Standard_D2s_v3 or higher on paid subscriptions."
  type        = string
  default     = "Standard_B2s "
}

variable "vm_westus2_name" {
  description = "Name of the West US 2 Linux VM"
  type        = string
  default     = "bo-sandbox-vm-usa-tf"
}

variable "vm_india_name" {
  description = "Name of the Central India Linux VM"
  type        = string
  default     = "bo-sandbox-vm-india-tf"
}

variable "vm_westus2_computer_name" {
  description = "OS computer name of the West US 2 VM (max 15 chars)"
  type        = string
  default     = "bosandvmusa"
}

variable "vm_india_computer_name" {
  description = "OS computer name of the Central India VM (max 15 chars)"
  type        = string
  default     = "bosandvmindia"
}

// OS Disk Variables Central India
variable "os_disk_size_gb" {
  description = "OS disk size in GiB for all VMs"
  type        = number
  default     = 30
}

variable "os_disk_storage_type" {
  description = "Storage account type for OS disks. StandardSSD_LRS is used for Azure Student subscriptions. Upgrade to Premium_LRS on paid subscriptions."
  type        = string
  default     = "StandardSSD_LRS"
}

variable "vm_westus2_os_disk_name" {
  description = "OS disk name for the West US 2 VM"
  type        = string
  default     = "bo-sandbox-vm-usa-disk1-tf"
}

variable "vm_india_os_disk_name" {
  description = "OS disk name for the Central India VM"
  type        = string
  default     = "bo-sandbox-vm-india-disk1-tf"
}

// Image Variables Central India
variable "image_publisher" {
  description = "VM image publisher"
  type        = string
  default     = "canonical"
}

variable "image_offer" {
  description = "VM image offer"
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "image_sku" {
  description = "VM image SKU"
  type        = string
  default     = "server"
}

variable "image_version" {
  description = "VM image version"
  type        = string
  default     = "latest"
}

// Key Vault Variables Central India
variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
  default     = "kv-bo-sandbox-tf"
}

variable "key_vault_sku" {
  description = "SKU name of the Key Vault"
  type        = string
  default     = "standard"
}

variable "key_vault_soft_delete_days" {
  description = "Soft-delete retention period in days for the Key Vault"
  type        = number
  default     = 90
}

// Network Interface Variables Central India
variable "nic_india_name" {
  description = "Name of the Central India NIC"
  type        = string
  default     = "bo-sandbox-nic-india-tf"
}

variable "nic_westus2_name" {
  description = "Name of the West US 2 NIC"
  type        = string
  default     = "bo-sandbox-nic-usa-tf"
}

// Public IP Variables Central India
variable "public_ip_india_name" {
  description = "Name of the Central India public IP"
  type        = string
  default     = "bo-sandbox-ip-india-tf"
}

variable "public_ip_westus2_name" {
  description = "Name of the West US 2 public IP"
  type        = string
  default     = "bo-sandbox-ip-usa-tf"
}

// Network Security Group Variables Central India
variable "nsg_india_name" {
  description = "NSG name for the Central India VM"
  type        = string
  default     = "bo-sandbox-nsg-india-tf"
}

variable "nsg_westus2_name" {
  description = "NSG name for the West US 2 VM"
  type        = string
  default     = "bo-sandbox-nsg-usa-tf"
}

// Virtual Network and Subnet Variables Central India
variable "vnet_india_name" {
  description = "Name of the Central India VNet"
  type        = string
  default     = "bo-sandbox-vnet-india-tf"
}

variable "vnet_westus2_name" {
  description = "Name of the West US 2 VNet"
  type        = string
  default     = "bo-sandbox-vnet-usa-tf"
}

variable "vnet_address_space" {
  description = "Address space for all VNets"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for all default subnets"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

// SSH Public Key Variables Central India
variable "ssh_public_key_resource_name" {
  description = "Name of the Azure SSH Public Key resource for West US 2"
  type        = string
  default     = "bo-sandbox-sshkey-usa-tf"
}

variable "ssh_public_key_india_resource_name" {
  description = "Name of the Azure SSH Public Key resource for Central India"
  type        = string
  default     = "bo-sandbox-sshkey-india-tf"
}
