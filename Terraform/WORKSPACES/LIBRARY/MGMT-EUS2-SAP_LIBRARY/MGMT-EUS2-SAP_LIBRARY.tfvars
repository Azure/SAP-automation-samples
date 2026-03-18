# The automation supports both creating resources (greenfield) or using existing resources (brownfield)
# For the greenfield scenario the automation defines default names for resources, if there is a XXXXname variable then the name is customizable
# for the brownfield scenario the Azure resource identifiers for the resources must be specified

#########################################################################################
#                                                                                       #
#  Terraform deploy parameters                                                          #
#                                                                                       #
#########################################################################################

# - deployer_tfstate_key is the state file name for the deployer
# These are required parameters, if using the deployment scripts they will be auto populated otherwise they need to be entered

#deployer_tfstate_key=null

#########################################################################################
#                                                                                       #
#  Infrastructure definitioms                                                          #
#                                                                                       #
#########################################################################################

# The environment value is a mandatory field, it is used for partitioning the environments, for example (PROD and NP)
environment = "MGMT"

# codename is an additional component for naming the resources
#codename = ""

# The location valus is a mandatory field, it is used to control where the resources are deployed
location = "eastus2"

# RESOURCEGROUP
# The two resource group name and arm_id can be used to control the naming and the creation of the resource group
# The resourcegroup_name value is optional, it can be used to override the name of the resource group that will be provisioned
# The resourcegroup_name arm_id is optional, it can be used to provide an existing resource group for the deployment
#resourcegroup_name=""
resourcegroup_arm_id = "<azure_resource_id>"

#resourcegroup_name=""
#resourcegroup_arm_id=""

# The resourcegroup_tags value is optional, it can be used to provide tags to be associated with the resource group
#resourcegroup_tags = {
#    "tag" = "value"
#}


# The use_deployer value is a boolean value indicating if the deployer is used as the deployment engine
#use_deployer=true

#######################################################################################
# Keyvault information
#######################################################################################



# user_keyvault_id is the Azure resource identifier for the keyvault containing the system credentials
#user_keyvault_id=""

# automation_keyvault_id is the Azure resource identifier for the keyvault containing the automation credentials
#automation_keyvault_id=""

# spn_keyvault_id is the Azure resource identifier for the keyvault containing the deployment credentials
#spn_keyvault_id=""

#######################################################################################
# SAP Binaries storage account
# This account will contain the downloaded SAP Media files
#######################################################################################

# library_sapmedia_arm_id is the Azure resource identifier for an existing storage account
#library_sapmedia_arm_id=""

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

#######################################################################################
# Terrafrom state storage account
# This account will contain the Terraform state files
#######################################################################################

# library_terraform_state_arm_id is the Azure resource identifier for an existing storage account
#library_terraform_state_arm_id=""

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

# dns_label if specified is the DNS name of the private DNS zone
dns_label = "azure.sdaf.contoso.net"

# use_private_endpoint is a boolean flag controlling if the keyvaults and storage accounts have private endpoints
#use_private_endpoint=false


# use_service_endpoint is a boolean flag controlling service_endpoints are used
#use_service_endpoint=false


# use_spn defines if the deployments are performed using Service Principals or the deployer's managed identiry, true=SPN, false=MSI
# use_spn = false

##########################################################################################
#                                                                                        #
#  Storage account configurations                                                        #
#                                                                                        #
##########################################################################################

# Defines the storage account tier
# storage_account_tier = "Premium_LRS"

# Defines the storage account replication type
# storage_account_replication_type = "LRS"

# Defines the storage account for the state files, by default a new storage account will be created
# storage_account_name = ""

# Defines if a blob container is created in the storage account, by default true
# create_containers = true

# Defines if the storage accounts are locked for deletion
# place_delete_lock_on_resources = false

##########################################################################################
#                                                                                        #
#  DNS zone configurations                                                               #
#                                                                                        #
##########################################################################################

# Defines if a new DNS zone is created for the SAP environment
# dns_zone_names = ["azure.sdaf.contoso.net"]

# Defines the resource group for the DNS zone
# dns_zone_resourcegroup_name = ""

# Defines if the DNS zone is private
# use_private_dns = false

##########################################################################################
#                                                                                        #
#  Web app configurations                                                                #
#                                                                                        #
##########################################################################################

# Defines if a web app is created for the SAP environment
# create_webapp = false

# Defines the name of the web app
# webapp_name = ""

# Defines the resource group for the web app
# webapp_resourcegroup_name = ""

# Defines the location for the web app
# webapp_location = ""

# Defines the SKU for the web app
# webapp_sku = "F1"

##########################################################################################
#                                                                                        #
#  Network configurations                                                                #
#                                                                                        #
##########################################################################################

# Defines the name of the virtual network
# network_name = ""

# Defines the address space for the virtual network
# network_address_space = ""

# Defines if the virtual network is created or an existing one is used
# network_arm_id = ""

# Defines if the virtual network is created with NSG
# use_custom_dns_names = false

# Defines if Azure Firewall is used
# use_azure_firewall = false

# Defines if the virtual network has a route table
# use_route_table = false

##########################################################################################
#                                                                                        #
#  Miscellaneous configurations                                                          #
#                                                                                        #
##########################################################################################

# Defines tags for the deployment
# tags = {}

# Defines if preview features are enabled
# enable_preview_features = false

# Defines if diagnostic logging is enabled
# enable_diagnostic_logging = false

# Defines the log analytics workspace ARM ID
# log_analytics_workspace_arm_id = ""

# Defines if Application Insights is used
# use_application_insights = false

# Defines the Application Insights ARM ID
# application_insights_arm_id = ""

# Additional optional configurations
# enable_rbac = false
# use_msi_for_clusters = false
# create_transport_storage = false
# create_install_storage = false


# Optional inputs not explicitly set above.
# These are sourced from terraform-docs and kept commented as documentation.

# Boolean value indicating if the Agent IP should be added to the storage and key vault firewalls
# add_Agent_IP = true

# Agent Network resource ID
# additional_network_id = ""

# IP address of the agent
# Agent_IP = ""

# Boolean value indicating if a webapp should be deployed
# application_configuration_deployment = false

# Defines the Azure application configuration Resource id
# application_configuration_id = ""

# Boolean value indicating if permissions should be assigned to the storage accounts
# assign_permissions = true

# The name of the control plane
# control_plane_name = ""

# Boolean value indicating if PrivateLink DNS Zones should be created
# create_privatelink_dns_zones = true

# If provided, the value of the custom random id
# custom_random_id = ""

# Boolean value indicating if storage account access is via data plane
# data_plane_available = true

# Details of deployer
# deployer = {}

# Defines the prefix for the deployer
# deployer_prefix = ""

# Folder name of folder containing the terraform state file
# deployer_statefile_foldername = ""

# The type of deployment
# deployment = "update"

# Boolean value indicating if firewall should be enabled for key vaults and storage
# enable_firewall_for_keyvaults_and_storage = true

# Details of the Azure infrastructure to deploy the SAP library into
# infrastructure = {}

# Import existing Azure Key Vaults
# key_vault = {}

# If defined, the name of the storage account where the SAP bits will be stored
# library_sapmedia_name = ""

# Optional name for the storage account where the terraform state will be stored
# library_terraform_state_name = ""

# If defined use an existing blob container for terraform vars
# library_terraform_vars_blob_container_is_existing = false

# If defined, the blob container name to create
# library_terraform_vars_blob_container_name = "tfvars"

# String value giving the possibility to register custom dns a records in a separate resourcegroup
# management_dns_resourcegroup_name = ""

# String value giving the possibility to register custom dns a records in a separate subscription
# management_dns_subscription_id = ""

# Management Network resource ID
# management_network_id = ""

# If provided, contains a json formatted file defining the name overrides
# name_override_file = ""

# Controls if resource groups are deleted even if they contain resources
# prevent_deletion_if_contains_resources = true

# String value giving the possibility to register custom PrivateLink DNS A records in a separate resourcegroup
# privatelink_dns_resourcegroup_name = ""

# String value giving the possibility to register custom PrivateLink DNS A records in a separate subscription
# privatelink_dns_subscription_id = ""

# Boolean value indicating if public access should be enabled for key vaults and storage
# public_network_access_enabled = true

# Boolean value indicating if endpoints should be registered to the dns zone
# register_endpoints_with_dns = true

# Boolean value indicating if storage accounts and key vaults should be registered to the corresponding dns zones
# register_storage_accounts_keyvaults_with_dns = true

# Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key.
# shared_access_key_enabled = false

# If defined, uses short names for private endpoints nics
# short_named_endpoints_nics = false

# SPN ID to be used for the deployment
# spn_id = ""

# Details of the Storage account for storing sap bits
# storage_account_sapbits = {}

# Details of the Storage account for storing tfstate
# storage_account_tfstate = {}

# The version of Terraform templates that were identified in the state file
# terraform_template_version = ""

# Boolean value indicating if a custom dns a record should be created when using private endpoints
# use_custom_dns_a_registration = false

# Boolean value indicating if a webapp should be created
# use_webapp = false


