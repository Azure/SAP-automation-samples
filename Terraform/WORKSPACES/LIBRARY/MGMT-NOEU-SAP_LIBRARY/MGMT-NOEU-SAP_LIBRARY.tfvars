# The automation supports both creating resources (greenfield) or using existing resources (brownfield)
# For the greenfield scenario the automation defines default names for resources, if there is a XXXXname variable then the name is customizable 
# for the brownfield scenario the Azure resource identifiers for the resources must be specified

#########################################################################################
#                                                                                       #
#  Environment definitions                                                              #
#                                                                                       #
#########################################################################################

# codename is used to describe the environment
# codename = ""

# subscription_id is the Azure subscription where the SAP library is deployed
# subscription_id = ""

# name_override_file is the name of the file containing the custom naming convention
# name_override_file = ""

# place_delete_lock_on_resources is a boolean flag to place delete lock on resources
# place_delete_lock_on_resources = false

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

# The location valus is a mandatory field, it is used to control where the resources are deployed
location = "northeurope"

# RESOURCEGROUP
# The two resource group name and arm_id can be used to control the naming and the creation of the resource group
# The resourcegroup_name value is optional, it can be used to override the name of the resource group that will be provisioned
# The resourcegroup_name arm_id is optional, it can be used to provide an existing resource group for the deployment
#resourcegroup_name=""
#resourcegroup_arm_id=""

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
use_private_endpoint=true


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
