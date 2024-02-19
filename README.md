<!-- Update the title -->
# IBM Cloud Core Security Services Deployable Architecture

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Incubating (Not yet consumable)](https://img.shields.io/badge/status-Incubating%20(Not%20yet%20consumable)-red)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-module-template?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-module-template/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!-- Add a description of module(s) in this repo -->
A Terraform module for provisioning IBM Cloud core Security services required to protect other IBM Cloud Instrastrucute and services.


<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-base-security-services-da](#terraform-ibm-base-security-services-da)
* [Examples](./examples)
    * [Basic example](./examples/basic)
    * [Complete example](./examples/complete)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and links to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in Authoring Guidelines in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- This heading should always match the name of the root level module (aka the repo name) -->
## terraform-ibm-module-template

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl
module "terraform_ibm_core_sercurity_services_da" {
    kp_instance_name    = "default-keyprotect-instance"
}
```

### Required IAM access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the sample Account and IBM Cloud service names and roles with the
information in the console at
Manage > Access (IAM) > Access groups > Access policies.
-->

You need the following permissions to run this module.

- Account Management
    - **Resource Group** service
        - `Viewer` platform access
- IAM Services
    - **Key Protect** service
        - `Editor` platform access
        - `Manager` service access

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >=1.59.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kp"></a> [kp](#module\_kp) | ./keyprotect/keyprotect_instance | n/a |
| <a name="module_kp_crk"></a> [kp\_crk](#module\_kp\_crk) | ./keyprotect/keyprotect_key | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform-ibm-modules/resource-group/ibm | 1.1.4 |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_crk"></a> [create\_crk](#input\_create\_crk) | Set to `true` to create Key Protect customer root key. | `bool` | `true` | no |
| <a name="input_create_kp"></a> [create\_kp](#input\_create\_kp) | Set to `true` to create Key Protect instance. | `bool` | `true` | no |
| <a name="input_crk_name"></a> [crk\_name](#input\_crk\_name) | The name of the customer root key. | `string` | `"default-rootkey"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key belonging to the account in which all the resources are created. | `string` | n/a | yes |
| <a name="input_kp_instance_id"></a> [kp\_instance\_id](#input\_kp\_instance\_id) | The Id of the Key Protct instance that contains the root key. | `string` | `""` | no |
| <a name="input_kp_location"></a> [kp\_location](#input\_kp\_location) | The region location of the Key Protect instance. | `string` | `""` | no |
| <a name="input_kp_name"></a> [kp\_name](#input\_kp\_name) | The name of the Key Protect instance. | `string` | `""` | no |
| <a name="input_kp_resource_group_id"></a> [kp\_resource\_group\_id](#input\_kp\_resource\_group\_id) | The ID of the resource group. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to append to all resources created by this example | `string` | `"core-security-services"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region used for all resource creation unless a resource specific region is used. | `string` | `"us-south"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of an existing resource group to provision resources in to. If not set a new resource group will be created using the prefix variable | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyprotect_default_rootkey_crn"></a> [keyprotect\_default\_rootkey\_crn](#output\_keyprotect\_default\_rootkey\_crn) | The CRN of the created customer root key in IBM Key Protect |
| <a name="output_keyprotect_default_rootkey_guid"></a> [keyprotect\_default\_rootkey\_guid](#output\_keyprotect\_default\_rootkey\_guid) | The GUID of the created customer root key in IBM Key Protect |
| <a name="output_keyprotect_default_rootkey_id"></a> [keyprotect\_default\_rootkey\_id](#output\_keyprotect\_default\_rootkey\_id) | The ID of the created customer root key in IBM Key Protect |
| <a name="output_keyprotect_instance_id"></a> [keyprotect\_instance\_id](#output\_keyprotect\_instance\_id) | The instance Id of the Key Protect instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
