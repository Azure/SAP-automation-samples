# The automation supports both creating resources (greenfield) or using existing resources (brownfield)
# For the greenfield scenario the automation defines default names for resources, if there is a XXXXname variable then the name is customizable
# for the brownfield scenario the Azure resource identifiers for the resources must be specified

# The automation supports both creating resources (greenfield) or using existing resources (brownfield)
# For the greenfield scenario the automation defines default names for resources,
# if there is a XXXXname variable then the name is customizable
# for the brownfield scenario the Azure resource identifiers for the resources must be specified

#########################################################################################
#                                                                                       #
#  Environment definitions                                                              #
#                                                                                       #
#########################################################################################

# The environment value is a mandatory field, it is used for partitioning the environments, for example (PROD and NP)
environment="LAB"

# codename is an additional component for naming the resources
#codename = ""

# The location valus is a mandatory field, it is used to control where the resources are deployed
location="swedencentral"

# subscription_id defines the Azure subscription_id
#subscription_id = ""

# name_override_file contains a json formatted file defining the name overrides
#name_override_file = ""

# place_delete_lock_on_resources defines if a delete lock will be placed on the key resources
#place_delete_lock_on_resources = false

# prevent_deletion_if_contains_resources controls if resource groups are deleted even if they contain resources
#prevent_deletion_if_contains_resources = true

# short_named_endpoints_nics uses short names for private endpoints nics
#short_named_endpoints_nics = false

# deployer_prefix defines the prefix for the deployer
#deployer_prefix = ""

# RESOURCEGROUP
# The two resource group name and arm_id can be used to control the naming and the creation of the resource group
# The resourcegroup_name value is optional, it can be used to override the name of the resource group that will be provisioned
# The resourcegroup_name arm_id is optional, it can be used to provide an existing resource group for the deployment
#resourcegroup_name="libtets"
#resourcegroup_arm_id="/subscriptions/dcb2713e-5dc8-4139-a9af-9768287bbb8d/resourceGroups/example-resources"

#resourcegroup_name=""
#resourcegroup_arm_id=""

# The resourcegroup_tags value is optional, it can be used to provide tags to be associated with the resource group
#resourcegroup_tags = {
#    "tag" = "value"
#}

# assign_permissions indicates if permissions should be assigned to the storage accounts
#assign_permissions = true

# The use_deployer value is a boolean value indicating if the deployer is used as the deployment engine
#use_deployer=true

# use_spn defines if the deployments are performed using Service Principals
#use_spn = false

# spn_id defines the SPN ID to be used for the deployment
#spn_id = ""

#########################################################################################
#                                                                                       #
#   Keyvault information                                                                #
#                                                                                       #
#########################################################################################

# user_keyvault_id is the Azure resource identifier for the keyvault containing the system credentials
#user_keyvault_id=""

# spn_keyvault_id is the Azure resource identifier for the keyvault containing the deployment credentials
#spn_keyvault_id=""

#########################################################################################
#                                                                                       #
#   SAP Binaries storage account                                                        #
#   This account will contain the downloaded SAP Media files                            #
#                                                                                       #
#########################################################################################

# library_sapmedia_arm_id is the Azure resource identifier for an existing storage account
#library_sapmedia_arm_id="/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/..."

# library_sapmedia_name defines the name of the storage account where the SAP bits will be stored
#library_sapmedia_name = ""

# library_sapmedia_account_tier is an optional parameter specifying the storage account tier
#library_sapmedia_account_tier="Standard"

# library_sapmedia_account_replication_type is an optional parameter specifying the storage account type
#library_sapmedia_account_replication_type="LRS"

# library_sapmedia_account_kind is an optional parameter specifying the storage account version
#library_sapmedia_account_kind="StorageV2"

# library_sapmedia_file_share_enable_deployment is boolean flag controlling the storage account deployment
#library_sapmedia_file_share_enable_deployment=true

# library_sapmedia_file_share_is_existing is boolean flag controlling if the File share already exists
#library_sapmedia_file_share_is_existing=false

# library_sapmedia_file_share_name is the name of the File share
#library_sapmedia_file_share_name="sapbits"

# library_sapmedia_blob_container_enable_deployment is boolean flag controlling the blob container deployment
#library_sapmedia_blob_container_enable_deployment=true

# library_sapmedia_blob_container_is_existing is boolean flag controlling if the blob container already exists
#library_sapmedia_blob_container_is_existing=false

# library_sapmedia_blob_container_name is the name of the blob container
#library_sapmedia_blob_container_name="sapbits"

#########################################################################################
#                                                                                       #
#   Terrafrom state storage account                                                     #
#   This account will contain the Terraform state files                                 #
#                                                                                       #
#########################################################################################

# library_terraform_state_arm_id is the Azure resource identifier for an existing storage account
#library_terraform_state_arm_id="/subscriptions/..."

# library_terraform_state_name defines the name of the storage account where the terraform state will be stored
#library_terraform_state_name = ""

# library_terraform_state_account_tier is an optional parameter specifying the storage account tier
#library_terraform_state_account_tier="Standard"

# library_terraform_state_account_replication_type is an optional parameter specifying the storage account type
#library_terraform_state_account_replication_type="LRS"

# library_terraform_state_account_kind is an optional parameter specifying the storage account version
#library_terraform_state_account_kind="StorageV2"

# library_terraform_state_blob_container_is_existing is boolean flag controlling if the terraform blob container already exists
#library_terraform_state_blob_container_is_existing=false

# library_terraform_state_blob_container_name is the name of the terraform blob container
#library_terraform_state_blob_container_name="tfstate"

# library_ansible_blob_container_is_existing is boolean flag controlling if the ansible blob container already exists
#library_ansible_blob_container_is_existing=false

# library_ansible_blob_container_name is the name of the ansible blob container
#library_ansible_blob_container_name="ansible"

# library_terraform_vars_blob_container_is_existing controls if the terraform vars blob container already exists
#library_terraform_vars_blob_container_is_existing=false

# library_terraform_vars_blob_container_name is the name of the terraform vars blob container
#library_terraform_vars_blob_container_name="tfvars"

# shared_access_key_enabled indicates whether the storage account permits requests to be authorized with the account access key via Shared Key
#shared_access_key_enabled = false

# data_plane_available indicates if storage account access is via data plane
#data_plane_available = true

# custom_random_id defines the value of the custom random id
#custom_random_id = ""

# public_network_access_enabled indicates if public access should be enabled for key vaults and storage
#public_network_access_enabled = true

#########################################################################################
#                                                                                       #
#   DNS Settings                                                                        #
#   This account will contain the downloaded SAP Media files                            #
#                                                                                       #
#########################################################################################

# dns_label if specified is the DNS name of the private DNS zone
dns_label="lab.sdaf.contoso.net"

# dns_zone_names defines the Private DNS zone names
#dns_zone_names = {
#  "file_dns_zone_name"      = "privatelink.file.core.windows.net"
#  "blob_dns_zone_name"      = "privatelink.blob.core.windows.net"
#  "table_dns_zone_name"     = "privatelink.table.core.windows.net"
#  "vault_dns_zone_name"     = "privatelink.vaultcore.azure.net"
#  "appconfig_dns_zone_name" = "privatelink.azconfig.io"
#}

# Boolean value indicating if a custom dns a record should be created when using private endpoints
# use_custom_dns_a_registration = false

# String value giving the possibility to register custom dns a records in a separate subscription
# management_dns_subscription_id = ""

# String value giving the possibility to register custom dns a records in a separate resourcegroup
management_dns_resourcegroup_name = ""

# privatelink_dns_subscription_id gives the possibility to register custom PrivateLink DNS A records in a separate subscription
#privatelink_dns_subscription_id = ""

# privatelink_dns_resourcegroup_name gives the possibility to register custom PrivateLink DNS A records in a separate resourcegroup
#privatelink_dns_resourcegroup_name = ""

# enable_firewall_for_keyvaults_and_storage indicates if firewall should be enabled for key vaults and storage
#enable_firewall_for_keyvaults_and_storage = true

# register_storage_accounts_keyvaults_with_dns indicates if storage accounts and key vaults should be registered to the corresponding dns zones
#register_storage_accounts_keyvaults_with_dns = true

# register_endpoints_with_dns indicates if endpoints should be registered to the dns zone
#register_endpoints_with_dns = true

# create_privatelink_dns_zones indicates if PrivateLink DNS Zones should be created
#create_privatelink_dns_zones = true

# use_private_endpoint is a boolean flag controlling if the keyvaults and storage accounts have private endpoints
#use_private_endpoint=false

# Web App and Application Configuration variables
#use_webapp = false

# application_configuration_deployment indicates if a webapp should be deployed
#application_configuration_deployment = false

# Agent_IP defines the IP address of the agent
#Agent_IP = ""

# add_Agent_IP indicates if the Agent IP should be added to the storage and key vault firewalls
#add_Agent_IP = true

#name_override_file = "name-overrides.json"

#########################################################################################
#                                                                                       #
#  Terraform deploy parameters                                                          #
#                                                                                       #
#########################################################################################

# - deployer_tfstate_key is the state file name for the deployer
# These are required parameters, if using the deployment scripts they will be auto populated otherwise they need to be entered

#deployer_tfstate_key=null

# use_spn defines if the deployments are performed using Service Principals or the deployer's managed identiry, true=SPN, false=MSI
# use_spn = false

#########################################################################################
#                                                                                       #
#  Network and Miscellaneous Settings                                                  #
#                                                                                       #
#########################################################################################

# additional_network_id defines the Agent Network resource ID
#additional_network_id = ""

# management_network_id defines the Management Network resource ID
#management_network_id = ""

# tfstate_resource_id defines the Resource id of tfstate storage account
#tfstate_resource_id = ""

# deployment defines the type of deployment
#deployment = "update"

# tags defines global tags for all resources
#tags = {}
