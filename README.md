# SAP Deployment Automation Framework samples

This repository contains shared configuration examples and SAP software
definitions for the SAP Deployment Automation Framework (SDAF). GitHub Actions,
Azure DevOps, and local execution can use these assets. Samples and bill of
materials (BOM) files are inputs to those three execution models. They are not a
fourth execution model.

For framework architecture, execution-model selection, and lifecycle guidance,
start at the central [`Azure/sap-automation`](https://github.com/Azure/sap-automation)
hub.

## Before you use a sample

1. **Select** GitHub Actions, Azure DevOps, or local execution in the central
   hub.
2. **Pin** compatible, reviewed commits or releases for the framework,
   execution repository, and this repository.
3. **Copy and customize** only the required sample assets in the repository
   that owns your deployment configuration.

## Choose a task

| Task | Start here |
| --- | --- |
| Prepare infrastructure configuration | [Use Terraform workspace samples](docs/01-00-terraform-samples.md) |
| Select SAP software definitions and BOM files | [Use SAP and BOM samples](docs/02-00-bom-samples.md) |
| Review an Ansible example | [`Ansible/playbook.yml`](Ansible/playbook.yml) |
| Propose a sample or BOM change | [Contribute to the repository](CONTRIBUTING.md) |

## Understand the repository content

| Path | Content | How to use it |
| --- | --- | --- |
| [`Terraform/WORKSPACES`](Terraform/WORKSPACES/) | Example `.tfvars` files for deployers, SAP libraries, workload zones, and SAP systems | Copy a selected example to your configuration repository, then replace environment-specific values before planning a deployment. |
| [`Terraform/RESOURCE_NAMES`](Terraform/RESOURCE_NAMES/) | Example resource-name definitions | Review and adapt the definitions only when your deployment path uses a custom resource-naming file. |
| [`SAP`](SAP/) | Predefined SAP product BOM definitions, dependencies, templates, and media records | Select a complete definition by its directory and YAML file stem. |
| [`BOM`](BOM/) | Separate application, database, and SAP kernel BOM component definitions | Select compatible components when your software-acquisition path assembles a combined BOM. |
| [`Ansible`](Ansible/) | Ansible sample content | Use the content as an example. The executable SDAF Ansible roles and playbooks are owned by the central repository. |

`Terraform/WORKSPACES/BOMS/sap-parameters.yaml` is an example software-
acquisition parameter file. It is not the BOM catalog. The active catalog
definitions are under `SAP` and `BOM`.

## How it works

Keep three types of content separate:

1. Store reviewed infrastructure configuration in your customer configuration
   repository under `WORKSPACES`.
2. Keep the SDAF implementation in the
   [`Azure/sap-automation`](https://github.com/Azure/sap-automation) checkout.
3. Make this repository available to the selected execution model when it
   resolves SAP software definitions.

The Ansible variable `BOM_directory` identifies the root of this repository.
The BOM registration role appends `SAP/<name>/<name>.yaml` and then
`BOM/<name>/<name>.yaml` when it resolves a definition. Do not set
`BOM_directory` to the `SAP` or `BOM` subdirectory.

Pin a reviewed repository commit or release for reproducible deployments.
Review every sample before use. Names, subscriptions, regions, network ranges,
DNS settings, virtual-machine sizes, credentials, and SAP media availability
are environment-specific.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for source, naming, validation, and pull
request requirements.

This project has adopted the
[Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information, see the
[Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com).

## Trademarks

This project may contain trademarks or logos for projects, products, or
services. Authorized use of Microsoft trademarks or logos is subject to and
must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must
not cause confusion or imply Microsoft sponsorship. Use of third-party
trademarks or logos is subject to the third party's policies.
