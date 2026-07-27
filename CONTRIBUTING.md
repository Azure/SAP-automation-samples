# Contributing to SAP automation samples

Thank you for contributing Terraform examples, SAP software definitions, BOM
components, Ansible examples, or documentation.

Most contributions require you to agree to a Contributor License Agreement
(CLA) that confirms you have the right to grant us permission to use the
contribution. For details, see the
[Microsoft CLA](https://cla.opensource.microsoft.com). The CLA bot checks pull
requests and provides instructions when action is required.

This project follows the
[Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).

## Confirm ownership

Submit a change here when it updates:

- a Terraform example under `Terraform`;
- a predefined SAP definition under `SAP`;
- an application, database, or kernel component under `BOM`;
- an Ansible example under `Ansible`; or
- documentation for these assets.

Submit Terraform module, Ansible role, downloader, validator, installation, or
local script changes to
[`Azure/sap-automation`](https://github.com/Azure/sap-automation). Submit
workflow or pipeline wrapper changes to the repository that owns that execution
model.

## General requirements

1. **Create** a focused branch from the current default branch.
2. **Identify** the source asset, consumer, and execution models affected by the
   change.
3. **Use** official vendor source data for Azure, Terraform, Ansible, and SAP
   values. Link the source in the pull request.
4. **Exclude** credentials, tokens, customer data, downloaded SAP software,
   Terraform state, and generated execution artifacts.
5. **Preserve** existing paths and naming conventions unless the change
   includes a compatibility reason and updates all in-repository references.
6. **Validate** only the affected assets with the current SDAF implementation
   and record the commands, versions, and results in the pull request.
7. **Run** `git diff --check` and review the final documentation and data-only
   diff.

## Contribute a Terraform sample

1. **Place** the sample in the matching `Terraform/WORKSPACES` stage directory:
   `DEPLOYER`, `LIBRARY`, `LANDSCAPE`, or `SYSTEM`.
2. **Match** the directory name and `.tfvars` file stem. Follow the established
   stage naming pattern described in
   [Use Terraform workspace samples](docs/01-00-terraform-samples.md).
3. **Replace** real subscriptions, tenants, credentials, customer domains,
   addresses, and resource identifiers with safe example values.
4. **Document** the topology and any nondefault dependency in the applicable
   existing `readme.md`.
5. **Compare** every variable with the matching root module at the SDAF version
   used for validation.
6. **Run** the plan or test mode through an execution path that consumes the
   sample. Review the plan for unexpected changes and destructive actions.
7. **Record** the SDAF commit, sample path, command or workflow, and plan result
   in the pull request.

A formatting or parsing check alone is not sufficient because sample values
control Azure architecture, cost, and state.

## Contribute an SAP or BOM definition

1. **Choose** `SAP` for a predefined complete product definition or `BOM` for a
   separate application, database, or kernel component.
2. **Match** the directory name and YAML file stem exactly.
3. **Follow** the naming and version pattern already used by the same product
   family. Do not infer one family convention from another.
4. **Update** product metadata, dependencies, media URLs, archive names,
   checksums, platforms, and compatibility fields from verifiable SAP source
   data.
5. **Preserve** the previous predefined SAP definition when the existing
   versioning procedure requires archival. Follow
   [`SAP/TSG/bomlinkupdate.md`](SAP/TSG/bomlinkupdate.md) for link updates and
   the special `latest` handling documented there.
6. **Run** the current SDAF BOM validator with the repository root as
   `BOM_directory` and the exact changed definition or component selection.
7. **Run** the applicable software-acquisition path when credentials and
   entitlements are available. Confirm dependency resolution, compatibility,
   download results, and checksums.
8. **Record** source links, the catalog commit, selected names, validator
   output, and any media that could not be entitlement-tested.

Do not weaken or remove a checksum to make a download pass. Do not claim that
obsolete SAP media is supported or replaceable without verifiable SAP source
data.

## Contribute an Ansible example

1. **Keep** the change under `Ansible` and limit it to sample behavior.
2. **Use** fully qualified Ansible collection names.
3. **Remove** environment-specific hosts, credentials, and customer data.
4. **Run** syntax and lint validation with the Ansible versions used by the
   current SDAF repository.
5. **Move** executable framework behavior to `Azure/sap-automation` when the
   change belongs in a shared role or playbook.

## Contribute documentation

1. **Use** sentence-case headings, short sentences, active voice, and explicit
   numbered actions.
2. **Use** relative links for files in this repository.
3. **Verify** every path, variable, and command against the current source.
4. **Preserve** useful existing paths and heading anchors.
5. **Check** every relative link and heading anchor, then run
   `git diff --check`.

## Report validation limits

State any validation that you could not perform. Explain whether the limit was
caused by SAP entitlement, unavailable media, Azure access, cost, or execution
environment. A pull request must not describe untested media or infrastructure
as validated.
