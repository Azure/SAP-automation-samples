# Use SAP and BOM samples

Use the SAP and BOM catalogs to select the software definitions consumed by
SDAF software acquisition and installation.

## Outcome

You have selected a source-backed SAP software definition, configured the
catalog root and BOM name correctly, and validated the selection through your
execution model before installation.

## Before you begin

- Select GitHub Actions, Azure DevOps, or local execution in the
  [`Azure/sap-automation`](https://github.com/Azure/sap-automation) hub.
- Clone this repository at a reviewed commit on the runner, agent, or local
  execution host.
- Obtain SAP software-download credentials and confirm that the account is
  entitled to the selected media.
- Confirm the SAP product, release, database platform and version, operating
  system, kernel, and installation topology.
- Confirm that the target software library has enough capacity for the media.

## Inputs

| Input | Meaning |
| --- | --- |
| `BOM_directory` | The root directory of this repository. The Ansible BOM registration role searches `<BOM_directory>/SAP/<name>/<name>.yaml` and then `<BOM_directory>/BOM/<name>/<name>.yaml`. |
| `bom_base_name` | The exact directory and YAML file stem for a predefined definition, or the hyphen-separated component selection passed to the dynamic BOM validator. |
| `application_bom_name` | An application component directory under `BOM`, such as an `APP_...` definition. |
| `database_bom_name` | A database component directory under `BOM`, such as a `DB_...` definition. |
| `sap_kernel_bom_name` | A kernel component directory under `BOM`, such as a `SAP_KERNEL_...` definition. |
| `save_bom_as` | The output name used by the dynamic BOM path when it assembles compatible components. |
| `bom_name` | An SAP-system `.tfvars` value that records the BOM selected for that system. It is not a filesystem path. |

`Terraform/WORKSPACES/BOMS/sap-parameters.yaml` is an example parameter file.
It does not replace the `SAP` or `BOM` catalog.

## Understand `SAP` and `BOM`

- [`SAP`](../SAP/) contains predefined product BOMs. A definition can include
  product identifiers, dependencies, installation templates, media URLs, and
  checksums. Select these definitions as one complete BOM name.
- [`BOM`](../BOM/) contains separate application, database, and SAP kernel
  components. The BOM validator can combine selected components and checks
  compatibility fields exposed by the application definition.
- `SAP/archives` preserves earlier predefined definitions. Do not select an
  archived definition unless your reviewed release procedure explicitly
  requires it.

Both active directories use `<name>/<name>.yaml`. Names and capitalization are
significant.

## Ownership

This repository owns the checked-in SAP and BOM definitions. The central
`Azure/sap-automation` repository owns the Ansible BOM validator, downloader,
and installation behavior. Your selected execution repository owns its
workflow or pipeline inputs. SAP owns the software-download service and media
entitlements.

## What the automation does

The execution model makes this repository available to SDAF and passes
`BOM_directory` and the selected name or component names. The Ansible
registration role resolves definitions under `SAP` and `BOM`. The BOM
validator loads dependencies, checks declared application, database, and
kernel compatibility for dynamic selections, and assembles the effective media
list. The software-acquisition path then downloads the entitled media to the
configured target.

## Review before execution

- Treat URLs and checksums as version-specific source data.
- Verify that application compatibility fields include the selected database
  platform, database version, and kernel when those fields are present.
- Review every dependency and media record required by the selected
  definition.
- Confirm that the download destination is the intended SAP software library.
- Do not add SAP credentials, access tokens, or downloaded software to this
  repository.
- Pin the sample commit. A name containing `latest` can change in a later
  commit.

## Select and run a BOM

1. **Choose** a predefined definition from `SAP` when your execution path
   accepts one complete BOM name, or choose compatible application, database,
   and kernel components from `BOM` when it supports dynamic assembly.
2. **Verify** that each selected directory contains a YAML file with the same
   stem. Record the repository commit and every selected name.
3. **Inspect** the selected YAML files. Confirm the product, release, platform,
   version, dependencies, media archives, URLs, and checksums against the
   approved SAP design.
4. **Set** `BOM_directory` to the repository root that contains the sibling
   `SAP` and `BOM` directories. Do not set it to either subdirectory.
5. **Set** the BOM input required by your execution model. Use the exact
   predefined stem or the exact application, database, kernel, and output names
   supported by that path.
6. **Run** the software-acquisition test or download procedure in the selected
   execution-model documentation. Use the reviewed repository commit and
   destination.
7. **Review** the validator and downloader output before starting SAP
   installation.

After these steps, the logs must identify the intended source definitions and
must not report a missing BOM or incompatible component selection.

## Validate

1. Confirm that `BOM_directory/SAP` and `BOM_directory/BOM` both exist.
2. Confirm that every selected `<name>/<name>.yaml` path exists with exact
   capitalization.
3. Confirm that the validator reports the intended application, database,
   kernel, and effective output name.
4. Confirm that dependency resolution and compatibility checks complete without
   an error.
5. Confirm that the downloader reports successful acquisition and checksum
   validation for the required media.
6. Record the catalog commit, selected names, generated BOM name when
   applicable, execution run, and software-library location.

Media availability can change independently of this repository. Validate the
actual acquisition before you schedule installation.

## If it fails

- For a missing definition, correct `BOM_directory`, spelling, capitalization,
  and the directory/file stem.
- For an incompatible dynamic selection, choose a database and kernel declared
  by the application definition.
- For an authentication or entitlement failure, verify the SAP account and use
  the diagnostic routing documented by the selected execution model.
- For an obsolete URL, checksum mismatch, or unavailable archive, open an issue
  in
  [`Azure/SAP-automation-samples`](https://github.com/Azure/SAP-automation-samples/issues).
  Include the definition path, repository commit, archive name, observed error,
  and verifiable SAP replacement details when available.
- For a validator or downloader implementation defect, open an issue in
  [`Azure/sap-automation`](https://github.com/Azure/sap-automation/issues).
- For a workflow or pipeline input defect, report it to the repository that
  owns that execution model.

An issue report does not guarantee that obsolete SAP media remains available
or that a replacement is compatible. Do not bypass checksum or compatibility
failures.

## Next step

Continue with the software-installation stage for your selected execution
model. Use the validated BOM name and the acquired media location.
