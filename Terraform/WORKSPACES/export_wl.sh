#!/bin/bash
export  ARM_SUBSCRIPTION_ID=""
export             env_code="DEV"
export          region_code="WEEU"
export            vnet_code="SAP01"
export deployer_environment="MGMT"


export DEPLOYMENT_REPO_PATH="${HOME}/Azure_SAP_Automated_Deployment/sap-automation"
export CONFIG_REPO_PATH="${HOME}/Azure_SAP_Automated_Deployment/WORKSPACES"
export SAP_AUTOMATION_REPO_PATH="${HOME}/Azure_SAP_Automated_Deployment/sap-automation"

cd "${CONFIG_REPO_PATH}/LANDSCAPE/${env_code}-${region_code}-${vnet_code}-INFRASTRUCTURE"
parameterFile="${env_code}-${region_code}-${vnet_code}-INFRASTRUCTURE.tfvars"
export parameterFile

