#!/bin/bash

export            env_code="MGMT"
export         region_code="WEEU"
export           vnet_code="DEP00"

export deployer_parameter_file="${CONFIG_REPO_PATH}/DEPLOYER/${env_code}-${region_code}-${vnet_code}-INFRASTRUCTURE/${env_code}-${region_code}-${vnet_code}-INFRASTRUCTURE.tfvars"
export library_parameter_file="${CONFIG_REPO_PATH}/LIBRARY/${env_code}-${region_code}-SAP_LIBRARY/${env_code}-${region_code}-SAP_LIBRARY.tfvars"

export CONTROL_PLANE_NAME="${env_code}-${region_code}-${vnet_code}"