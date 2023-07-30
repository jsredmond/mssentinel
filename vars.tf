variable "company_name" {
  description = "The name of the company"
  type        = string
  default     = "mycompany"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg"
}

variable "location" {
  description = "The location for all resources"
  type        = string
  default     = "eastus"
}

variable "customer_managed_key_enabled" {
  description = "Specifies if the Workspace is using Customer managed key"
  type        = bool
  default     = false
}
