# Use Terraform workspace samples

Use the Terraform workspace samples to prepare reviewed infrastructure
configuration for an SDAF deployment.

## Outcome

You have environment-specific `.tfvars` files in your customer configuration
repository. The files retain the directory structure expected by your selected
GitHub Actions, Azure DevOps, or local execution path.

## Before you begin

- Select an SDAF execution model in the
  [`Azure/sap-automation`](https://github.com/Azure/sap-automation) hub.
- Clone or download this repository at a reviewed commit.
- Obtain the approved architecture, subscription, identity, networking, DNS,
  region, availability, sizing, and naming decisions for the deployment.
- Identify the branch and directory in your customer configuration repository
  that owns `WORKSPACES`.

## Inputs

| Deployment stage | Sample path | Directory and file pattern |
| --- | --- | --- |
| Deployer | `Terraform/WORKSPACES/DEPLOYER` | `<environment>-<region>-<deployer>-INFRASTRUCTURE/<same-name>.tfvars` |
| SAP library | `Terraform/WORKSPACES/LIBRARY` | `<environment>-<region>-SAP_LIBRARY/<same-name>.tfvars` |
| Workload zone | `Terraform/WORKSPACES/LANDSCAPE` | `<environment>-<region>-<network>-INFRASTRUCTURE/<same-name>.tfvars` |
| SAP system | `Terraform/WORKSPACES/SYSTEM` | `<environment>-<region>-<network>-<SAP-system-id>/<same-name>.tfvars` |

The repository also contains:

- `Terraform/WORKSPACES/CONFIGURATIONS/anf_sizes.json`, an example Azure NetApp
  Files sizing configuration.
- `Terraform/WORKSPACES/BOMS/sap-parameters.yaml`, an example
  software-acquisition parameter file.
- `Terraform/RESOURCE_NAMES/X00_resource_names.json`, an example custom
  resource-name definition.
- `export.sh`, `export_cp.sh`, and `export_wl.sh`, local shell examples with
  environment-specific paths and empty identity values. Do not treat them as
  production defaults.

## Ownership

This repository owns the sample values and sample directory structure. Your
customer configuration repository owns every copied and customized file. The
central `Azure/sap-automation` repository owns Terraform behavior. The GitHub
Actions or Azure DevOps bootstrap repository owns its execution wrapper.

## What the automation does

This repository does not run Terraform. Your selected execution model passes
the copied `.tfvars` file to the matching SDAF root module. The resulting
Terraform plan, state, and Azure resources belong to that deployment, not to
this samples repository.

## Review before execution

Do not deploy an example without review. Sample files can contain illustrative
resource names, address spaces, regions, DNS values, virtual-machine sizes,
storage settings, and references to other sample environments.

- Confirm that the target subscription and tenant are correct.
- Check every network range for overlap.
- Review resource SKUs, redundancy, and cost.
- Remove or replace sample identifiers and cross-environment references.
- Keep credentials and secret values outside committed `.tfvars` files.
- Preserve existing Terraform state. Do not run concurrent operations against
  the same state.

## Prepare the configuration

1. **Select** the stage directory that matches the resource you need to
   configure. Read its existing `readme.md` when one is present.
2. **Choose** the closest sample based on topology and platform, not only on its
   environment label. Record the source commit and sample path.
3. **Copy** the complete sample directory into
   `WORKSPACES/<stage>` in your customer configuration repository.
4. **Rename** the copied directory and `.tfvars` file together. Keep the file
   stem identical to the directory name and follow the pattern in the inputs
   table.
5. **Replace** all sample-specific values with approved values for your
   environment. Review optional blocks instead of assuming that commented or
   populated examples apply.
6. **Review** any referenced JSON, remote network, DNS, key vault, storage, or
   control-plane values. Confirm that each referenced artifact exists in your
   configuration.
7. **Commit** the customized files to a review branch in the customer
   configuration repository. Do not modify the source sample in place for a
   deployment.
8. **Run** the plan or test mode documented by your selected execution model.
   Use the reviewed configuration commit and the intended Terraform state.

After these steps, the plan must use the copied file from your customer
configuration repository, not the original file in this repository.

## Validate

1. Confirm that the copied directory and `.tfvars` file have the same stem.
2. Search the copied files for sample environment names, placeholder values,
   unexpected subscriptions, and credentials.
3. Run `git diff --check` in the customer configuration repository.
4. Review the complete Terraform plan. Verify the resource names, locations,
   address spaces, DNS configuration, SKUs, quantities, and destructive
   actions.
5. Record the sample source commit, configuration commit, SDAF version, and
   approved plan with the deployment change.

Do not use a successful syntax check as approval to deploy. The reviewed
Terraform plan is the observable validation for environment-specific values.

## If it fails

- If a path is not found, verify the `WORKSPACES/<stage>/<name>/<name>.tfvars`
  structure and case.
- If Terraform rejects a variable, compare the copied file with the variables
  in the matching root module at the SDAF version you are running.
- If the sample itself is incorrect, open an issue in
  [`Azure/SAP-automation-samples`](https://github.com/Azure/SAP-automation-samples/issues)
  and include the sample path, source commit, expected result, and plan error.
- If the Terraform module fails independently of the sample values, report the
  problem to
  [`Azure/sap-automation`](https://github.com/Azure/sap-automation/issues).
- If only a workflow or pipeline wrapper fails, use the repository that owns
  that execution model.

Do not apply a plan until the owning configuration and implementation issues
are resolved.

## Next step

Return to the selected execution-model journey in the
[`Azure/sap-automation`](https://github.com/Azure/sap-automation) hub. Complete
its plan review and deployment procedure for the configured stage.
