/********************************************************************
This file is used to implement the ROOT module.
*********************************************************************/
module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.4"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}
module "kp" {
  count             = (var.create_kp) ? 1 : 0
  source            = "./keyprotect/keyprotect_instance"
  kp_name           = var.kp_name
  kp_location       = (var.kp_location == "") ? var.region : var.kp_location
  resource_group_id = (var.kp_resource_group_id == "") ? module.resource_group.resource_group_id : var.kp_resource_group_id
}

module "kp_crk" {
  count               = (var.create_crk) ? 1 : 0
  source              = "./keyprotect/keyprotect_key"
  keyprotect_guid     = (var.kp_instance_id == "") ? module.kp[0].instance_id : var.kp_instance_id
  secret_name         = var.crk_name
  is_standard_key     = false
  enable_force_delete = false
}
