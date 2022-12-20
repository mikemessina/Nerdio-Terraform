variable "base_name" {
  description = "(Required) Base name for all resources to be deployed. Resource-specific suffixes will be appended."
  type        = string
}

variable "location" {
  description = "(Required) Azure region into which all resources will be deployed."
  type        = string
}

variable "vnet_address_space" {
  description = "(Required) Address space to be assigned to the new virtual network."
  type        = list(string)
}

variable "allow_public_access" {
  description = "(Optional) Should public access be enabled to services. Defaults to `false`."
  type        = bool
  default     = false
}

variable "webapp_sku" {
  description = "(Optional) SKU of the SQL database to deploy. Defaults to `B3`."
  type        = string
  default     = "B3"
}

variable "sql_sku" {
  description = "(Optional) SKU of the SQL database to deploy. Defaults to `S1`."
  type        = string
  default     = "S1"
}

variable "allow_delegated_write_permissions" {
  description = "(Optional) Should the Azure AD application be deployed with delegated Azure AD write permissions. Defaults to `true`."
  type        = bool
  default     = true
}

variable "nerdio_tag_prefix" {
  description = "(Optional) Prefix to be used by Nerdio for its tags. Defaults to `NMW`."
  type        = string
  default     = "NMW"
}

variable "tags" {
  description = "(Optional) Tags to be applied to all resources."
  type        = map(string)
  default     = {}
}
