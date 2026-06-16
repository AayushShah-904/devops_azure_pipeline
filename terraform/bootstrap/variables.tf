variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for the state backend"
  type        = string
  default     = "bo-sandbox-backend-rg"
}

variable "location" {
  description = "Azure region for the backend resources"
  type        = string
  default     = "centralindia"
}

variable "storage_account_name" {
  description = "Storage account name for the state backend (must be globally unique)"
  type        = string
  default     = "bosandboxstate4427"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
  default     = "tfstate"
}
