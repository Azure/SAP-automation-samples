
# Infrastructure block
# The environment value is a mandatory field, it is used for partitioning the environments, for example (PROD and NP)
environment = "MGMT"

# codename is an additional component for naming the resources
#codename = ""

# The location/region value is a mandatory field, it is used to control where the resources are deployed
location = "eastus2"

# subscription_id defines the Azure subscription_id
#subscription_id = ""

# prevent_deletion_if_contains_resources controls if resource groups are deleted even if they contain resources
#prevent_deletion_if_contains_resources = true

# recover is a boolean flag indicating if the deployer should be recovered
#recover = false

# RESOURCEGROUP
# The two resource group name and arm_id can be used to control the naming and the creation of the resource group
# The resourcegroup_name value is optional, it can be used to override the name of the resource group that will be provisioned
# The resourcegroup_name arm_id is optional, it can be used to provide an existing resource group for the deployment
#resourcegroup_name=""
resourcegroup_arm_id = "<azure_resource_id>"

# place_delete_lock_on_resources defines if a delete lock will be placed on the key resources
#place_delete_lock_on_resources = false


#resourcegroup_tags = {
# tag=value    
#    }
#
# Networking information
#

#management_network_name=""
management_network_arm_id = "<azure_resource_id>"
#management_network_address_space="10.10.20.0/25"


# management subnet
# If defined these parameters control the subnet name and the subnet prefix
# management_subnet_name is an optional parameter and should only be used if the default naming is not acceptable 
#management_subnet_name=""

# management_subnet_address_prefix is a mandatory parameter if the subnets are not defined in the workload or if existing subnets are not used
#management_subnet_address_prefix="10.10.20.64/28"
# management_subnet_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing subnet to use
management_subnet_arm_id = "<azure_resource_id>"

# management_subnet_nsg_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing network security group to use
#management_subnet_nsg_arm_id="/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/MGMT-WEEU-MGMT01-INFRASTRUCTURE/providers/Microsoft.Network/networkSecurityGroups/MGMT-WEEU-SAP01_managementSubnet-nsg"

##################################################
#
# Azure Firewall
#
##################################################

# firewall_deployment is a boolean flag controlling if an Azure firewall is to be deployed in the deployer VNet
firewall_deployment = false

# management_firewall_subnet_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing firewall subnet
management_firewall_subnet_arm_id = "<azure_resource_id>"

# management_firewall_subnet_address_prefix is a mandatory parameter if the subnets are not defined in the workload or if existing subnets are not used
#management_firewall_subnet_address_prefix="10.10.20.0/26"


# firewall_rule_subnets is an optional list of subnets to be added to the Azure firewall
#firewall_rule_subnets=[]

# firewall_rule_allowed_ipaddresses is an optional list of IP Addresses to be added to the Azure firewall
#firewall_rule_allowed_ipaddresses=[]

##################################################
#
# Webapp Subnet
#
##################################################

# one of the following two parameters is required when deploying the web app as a part of the control plane infrastructure

# webapp_subnet_address_prefix is a mandatory parameter if an existing subnet is not used
# webapp_subnet_address_prefix = "10.10.20.128/26"

# webapp_subnet_arm_id is an optional parameter that if provided specifies the Azure resource identifier for an existing webapp subnet
# webapp_subnet_arm_id= ""

##################################################
#
# Azure Bastion
#
##################################################

# bastion_deployment is a boolean flag controlling if Azure bastion is to be deployed in the deployer VNet
bastion_deployment = false

# management_bastion_subnet_arm_id is an optional parameter that if provided specifies Azure resource identifier for the existing AzureBastion subnet
# management_bastion_subnet_arm_id= ""

# management_bastion_subnet_address_prefix is a mandatory parameter if bastion is deployed and if the subnets are not defined in the workload or if existing subnets are not used
# management_bastion_subnet_address_prefix="10.10.20.128/26"


########################################################
#
#         Deployer VM information
#
########################################################

deployer_enable_public_ip = true

# deployer_size is optional and defines the virtual machine SKU
#deployer_size="Standard_D4ds_v4"

# deployer_disk_type is optional and defines the virtual machine disk type
#deployer_disk_type"="Premium_LRS"

# deployer_use_DHCP is a boolean flag controlling if Azure subnet provided IP addresses should be used (true)
#deployer_use_DHCP = true

# private_ip_address if defined will provide the IP addresses for the network interface cards 
#private_ip_address=""

#
# The deployer_image defines the Virtual machine image to use, if source_image_id is specified the deployment will use the custom image provided, in this case os_type must also be specified

deployer_image = {
  "type"            = "marketplace"
  "os_type"         = "Linux"
  "source_image_id" = ""
  "publisher"       = "Canonical"
  "offer"           = "0001-com-ubuntu-server-jammy"
  "sku"             = "22_04-lts-gen2"
  "version"         = "latest"
}

# Use this field if you are using a marketplace image that has a plan attached to it
plan = {
  "use"       = false
  "name"      = ""
  "publisher" = ""
  "product"   = ""
}

# deployer_diagnostics_account_arm_id defines the diagnosting storage account for the deployer
# deployer_diagnostics_account_arm_id = ""

# deployer_authentication_type defines the authentication type for the deployer virtual machine
#deployer_authentication_type="key"

# use_spn defines if the deployments are performed using Service Principals or the deployer's managed identiry, true=SPN, false=MSI
# use_spn = false

# user_assigned_identity_id defines the user assigned identity that will be assigned to the deployers
#user_assigned_identity_id="/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/XXXXXXXX/providers/Microsoft.ManagedIdentity/userAssignedIdentities/xxxxxxxxxx"

# deployer_diagnostics_account_arm_id defines the diagnosting storage account for the deployer
#deployer_diagnostics_account_arm_id = ""


/*
This block describes the variables for the authentication section block in the json file
*/

# deployer_authentication_type defines the authentication type for the deployer virtual machine 
#deployer_authentication_type="key"

# deployer_authentication_username defines the username for the deployer virtual machine
#deployer_authentication_username="azureadm"

# deployer_authentication_password if defined is the password for the deployer virtual machine
#deployer_authentication_password=""

# deployer_authentication_path_to_public_key if defined is the path to the file containing the public key for the deployer virtual machine
#deployer_authentication_path_to_public_key=""

# deployer_authentication_path_to_private_key if defined is the path to the file containing the private key for the deployer virtual machine
#deployer_authentication_path_to_private_key=""

# These variables define the keyvault that is used to store the deployer credentials
# user_keyvault_id is the Azure resource identifier for the keyvault that will contain the credentials keys
#user_keyvault_id=""

# automation_keyvault_id is the Azure resource identifier for the keyvault that will be used by the automation (not used currently)
#automation_keyvault_id=""

# deployer_private_key_secret_name if provided contains the secret name for the private key 
#deployer_private_key_secret_name=""

# deployer_public_key_secret_name if provided contains the secret name for the public key 
#deployer_public_key_secret_name=""

# deployer_username_secret_name if provided contains the secret name for the username 
#deployer_username_secret_name=""

# deployer_password_secret_name if provided contains the secret name for the password 
#deployer_password_secret_name=""


# deployer_assign_subscription_permissions is a boolean flag controlling if the deployment credential should be assigned Contribuor permissions on the subscription
#deployer_assign_subscription_permissions=true

# use_private_endpoint is a boolean flag controlling if the keyvaults and storage accounts have private endpoints
# use_private_endpoint=false

# use_service_endpoint is a boolean flag controlling service_endpoints are used
#use_service_endpoint=false

# auto_configure_deployer is a boolean flag controlling if the automation should try to configure the deployer automatically
# set to false if outbound internet on the deployer is not available
auto_configure_deployer = true


# List of object IDs to add to key vault policies"
#additional_users_to_add_to_keyvault_policies=["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"]

# List of subnet IDs to add to storage account and key vault firewalls"
#subnets_to_add_to_firewall_for_keyvaults_and_storage=["<azure_resource_id_for_subnet>"]

# tf_version defines the Terraform version to install on deployer
#tf_version = "1.12.2"

# name_override_file contains a json formatted file defining the name overrides
#name_override_file = ""

# spn_id defines the SPN ID to be used for the deployment
#spn_id = ""

# additional_network_id defines the Agent Network resource ID
#additional_network_id = ""

# tags defines global tags for all resources
#tags = {}

#########################################################################################
#                                                                                       #
#                                     DNS Settings                                      #
#                                                                                       #
#########################################################################################

# use_custom_dns_a_registration indicates if a custom dns a record should be created when using private endpoints
#use_custom_dns_a_registration = false

# management_dns_subscription_id gives the possibility to register custom dns a records in a separate subscription
#management_dns_subscription_id = ""

# management_dns_resourcegroup_name gives the possibility to register custom dns a records in a separate resourcegroup
#management_dns_resourcegroup_name = ""

# dns_zone_names defines the Private DNS zone names
#dns_zone_names = {
#  "file_dns_zone_name"      = "privatelink.file.core.windows.net"
#  "blob_dns_zone_name"      = "privatelink.blob.core.windows.net"
#  "table_dns_zone_name"     = "privatelink.table.core.windows.net"
#  "vault_dns_zone_name"     = "privatelink.vaultcore.azure.net"
#  "appconfig_dns_zone_name" = "privatelink.azconfig.io"
#}

# privatelink_dns_subscription_id gives the possibility to register custom PrivateLink DNS A records in a separate subscription
#privatelink_dns_subscription_id = ""

# privatelink_dns_resourcegroup_name gives the possibility to register custom PrivateLink DNS A records in a separate resourcegroup
#privatelink_dns_resourcegroup_name = ""

# register_endpoints_with_dns indicates if endpoints should be registered to the dns zone
#register_endpoints_with_dns = true

# register_storage_accounts_keyvaults_with_dns indicates if storage accounts and key vaults should be registered to the corresponding dns zones
#register_storage_accounts_keyvaults_with_dns = true

#########################################################################################
#                                                                                       #
#                                 Azure DevOps Settings                                #
#                                                                                       #
#########################################################################################

# agent_pool contains the name of the agent pool to be used
#agent_pool = ""

# agent_pat contains the Personal Access Token to be used
#agent_pat = ""

# agent_ado_url contains the Url to the ADO repository
#agent_ado_url = ""

# agent_ado_project contains the project name ADO repository
#agent_ado_project = ""

# ansible_core_version contains the version of ansible core to be installed
#ansible_core_version = ""

# dev_center_deployment indicates if a Dev Center should be deployed
#dev_center_deployment = false

# DevOpsInfrastructure_object_id defines the Service principal object id for the DevOps Infrastructure
#DevOpsInfrastructure_object_id = ""

#########################################################################################
#                                                                                       #
#                               Agent Subnet Variables                                  #
#                                                                                       #
#########################################################################################

# agent_subnet_name defines the name of the subnet into which the managed agents will be deployed
#agent_subnet_name = ""

# agent_subnet_arm_id defines the Azure resource identifier for the existing subnet into which the managed agents will be deployed
#agent_subnet_arm_id = ""

# agent_subnet_address_prefix defines the address prefix of the subnet into which the managed agents will be deployed
#agent_subnet_address_prefix = ""

#########################################################################################
#                                                                                       #
#                              Web Application Settings                                 #
#                                                                                       #
#########################################################################################

# use_webapp indicates if a webapp should be deployed
#use_webapp = false

# app_service_deployment indicates if a webapp should be deployed
#app_service_deployment = false

# app_registration_app_id defines the app registration id to be used for the webapp
#app_registration_app_id = ""

# sa_connection_string defines the connection string for the Terraform state storage account
#sa_connection_string = ""

# webapp_client_secret defines the client secret for the webapp
#webapp_client_secret = ""

# app_service_devops_authentication_type defines the Authentication to use when calling Azure DevOps, MSI/PAT
#app_service_devops_authentication_type = "MSI"

# app_service_SKU_name defines the SKU of the App Service Plan
#app_service_SKU_name = "S1"

# enable_firewall_for_keyvaults_and_storage indicates if firewall should be enabled for key vaults and storage [OBSOLETE]
#enable_firewall_for_keyvaults_and_storage = false

# Agent_IP defines the IP address of the agent
#Agent_IP = ""

# add_Agent_IP indicates if the Agent IP should be added to the storage and key vault firewalls
#add_Agent_IP = true

#########################################################################################
#                                                                                       #
#                                    Identity                                           #
#                                                                                       #
#########################################################################################

# user_assigned_identity_id defines the User assigned Identity resource Id
#user_assigned_identity_id = ""

# add_system_assigned_identity indicates if a system assigned identity should be added to the deployer
#add_system_assigned_identity = false

# use_spn indicates if login should be performed using a service principal when performing the deployment
#use_spn = false

#########################################################################################
#                                                                                       #
#                                     Application Configuration                         #
#                                                                                       #
#########################################################################################

# Defines the Azure application configuration Resource id
#application_configuration_id = ""

# If defined, will add the Azure Application configuration to the control plane
#application_configuration_deployment = true

#########################################################################################
#                                                                                       #
#                                Extension Variables                                    #
#                                                                                       #
#########################################################################################

# deploy_monitoring_extension adds the Microsoft.Azure.Monitor.AzureMonitorLinuxAgent extension to the virtual machines
#deploy_monitoring_extension = false

# deploy_defender_extension adds the Microsoft.Azure.Security.Monitoring extension to the virtual machines
#deploy_defender_extension = false