#!/bin/bash

export ARM_SUBSCRIPTION_ID=""
export       ARM_CLIENT_ID=""
export         ARM_USE_MSI="true"
export       ARM_TENANT_ID=""

if [ ! -v CONFIG_REPO_PATH ]; then
	export CONFIG_REPO_PATH="${HOME}/Azure_SAP_Automated_Deployment/WORKSPACES"
fi
if [ ! -v SAP_AUTOMATION_REPO_PATH ]; then
	export SAP_AUTOMATION_REPO_PATH="${HOME}/Azure_SAP_Automated_Deployment/sap-automation"
fi
