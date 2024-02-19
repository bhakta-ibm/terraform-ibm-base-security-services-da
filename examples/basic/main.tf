##############################################################################
# Resource group
##############################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.4"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}


########################################################################################################################
# Base Security Default Instances
########################################################################################################################

module "base_security_default_instances" {
  source            = "../../keyprotect/keyprotect_instance"
  resource_group_id = module.resource_group.resource_group_id
  kp_location = var.region
  kp_name = "kp-default-instance"
}
