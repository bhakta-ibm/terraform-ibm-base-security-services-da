########################################################################################################################
# Input Variables
########################################################################################################################

######KEY PROTECT ###########################

variable "create_kp" {
  type        = bool
  description = "Set to `true` to create Key Protect instance."
  default     = true
}

variable "kp_name" {
  type        = string
  description = "The name of the Key Protect instance. "
  default     = ""
}

variable "kp_location" {
  type        = string
  description = "The region location of the Key Protect instance. "
  default     = ""
}

variable "kp_resource_group_id" {
  type        = string
  description = "The ID of the resource group."
  default     = ""
}

variable "kp_instance_id" {
  type        = string
  description = "The Id of the Key Protct instance that contains the root key."
  default     = ""
}

variable "create_crk" {
  type        = bool
  description = "Set to `true` to create Key Protect customer root key."
  default     = true
}

variable "crk_name" {
  type        = string
  description = "The name of the customer root key."
  default     = "default-rootkey"
}
################################

variable "region" {
  type        = string
  description = "The region used for all resource creation unless a resource specific region is used."
  default     = "us-south"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "API key belonging to the account in which all the resources are created."
  sensitive   = true
}

variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
  default     = "core-security-services"
}

variable "resource_group" {
  type        = string
  description = "The name of an existing resource group to provision resources in to. If not set a new resource group will be created using the prefix variable"
  default     = null
}
