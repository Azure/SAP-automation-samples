# Updating BOM Links

- [Updating BOM Links](#updating-bom-links)
  - [Key points about folder and file structure](#key-points-about-folder-and-file-structure)
  - [Procedure](#procedure)
  - [Procedure for SWPM and SUM files](#procedure-for-swpm-and-sum-files)
  - [How to Get the Updated BOM Link](#how-to-get-the-updated-bom-link)
  - [Knowledge Base of Dependent Packages from Previous BOM Link Updates](#knowledge-base-of-dependent-packages-from-previous-bom-link-updates)
  - [FAQs](#faqs)

## Key points about folder and file structure
1. The BOM folder structure follows a specific pattern: The BOM file is placed inside a folder with the same name as the BOM file (excluding the file extension).
   For example, the file HANA_2_00_067_v0003ms.yaml is contained within a folder named HANA_2_00_067_v0003ms.
1. Each BOM folder and file includes a version number at the end of its name. In the previous example, the version number is v0003ms.
1. The BOM file itself contains the file name and version number at the beginning of the file. For instance:
   ```yaml
   name: 'HANA_2_00_067_v0003ms'
   target: 'HANA 2.0'
   version: 3
   platform: 'HANA'
   ```

## Procedure
1. The goal is to update BOM files that reference outdated links, such as SAP packages or SWPM modules.
   To maintain a record of previous versions with outdated links, we move the old files to the archives folder.
   If you need to update SWPM and SUM packages, refer to [this procedure](#procedure-for-swpm-and-sum-files).
1. Obtain the new BOM link by following the procedure described [here](#how-to-get-the-updated-bom-link).
1. Identify the files that reference the outdated BOM link. For example, let's assume there are two files, NAME_01_00_v0005ms.yaml and NAME2_02_22_v0004ms.yaml, located in folders named NAME_01_00_v0005ms and NAME2_02_22_v0004ms respectively.
   Each folder and file has a version number appended at the end of its name, following the format `v<versionnumber>ms` (e.g., NAME_01_00_v0005ms).
1. Copy the folders NAME_01_00_v0005ms and NAME2_02_22_v0004ms to the archives folder to preserve the previous versions of the BOM files.
1. Update the folder names and the BOM file names within the folders to reflect the updated version number. In this case, the folder names should be updated to NAME_01_00_v0006ms and NAME2_02_22_v0005ms, and the file names should be updated to NAME_01_00_v0006ms.yaml and NAME2_02_22_v0005ms.yaml.
1. Update the version number and file name within the BOM files themselves, as explained in the [key points about folder and file structure](#key-points-about-folder-and-file-structure).

## Procedure for SWPM and SUM files

1. For SWPM and SUM files, the folder and file names include the version number `latest`. For example, the file SUM20SP16_latest.yaml is contained within the folder SUM20SP16_latest.
1. When copying this folder to the archives directory, remove the `latest` from the file and folder names, and replace it with a version number higher than the latest version in the archives directory for that BOM file.

For example, let's assume that the latest BOM directory for SUM20SP16 in the archives folder is SUM20SP16_v0006. To update the BOM links, follow these steps:

1. Copy the SUM/SWPM directory to the archives folder, maintaining the constraints mentioned earlier. Rename the copied directory from SUM20SP16_latest to SUM20SP16_v0007, and rename the BOM file within it as SUM20SP16_v0007.yaml.

1. Once the SUM/SWPM directory is copied to the archives folder, update the outdated link in the SUM20SP16_latest.yaml file located in the SUM20SP16_latest folder (outside the archives directory).

1. The SUM / SWPM BOM file also has a version number mentioned within it. Increase the version number present in the SUM / SWPM BOM file present in this format:
    ```yaml
    name:    'SUM20SP16'
    target:  'SUM20SP16'
    version: 007
    ```
    The version number here will get updated to 008 and this will look like this after modification:
    ```yaml
    name:    'SUM20SP16'
    target:  'SUM20SP16'
    version: 008
    ```

## How to Get the Updated BOM Link

To obtain the updated BOM link, follow these steps:

1. Log on to the [SAP Support Portal](https://launchpad.support.sap.com/#/softwarecenter).
1. Go to Software Downloads.
1. Search for the file using the archive name, excluding the version. For example, if the file is named SUM20SP16_6-80002456.SAR, search with the package name "SUM20SP16".
1. If there is a later version available for this package, that should be the new link for the package. Ensure that you use the link for the correct target operating system.

## Knowledge Base of Dependent Packages from Previous BOM Link Updates

Here is a knowledge base of dependent packages resulting from previous BOM link updates:

| Is installer component | Archive name (Example)          | Dependent Archive name examples                                                                 |
|------------------------|---------------------------------|--------------------------------------------------------------------------------------------------|
| No                     | IMDB_SERVER20_067_1-80002031.SAR | IMDB_AFL20_067_0-80001894.SAR, IMDB_LCAPPS_2067_0-20010426.SAR, VCH202100_2067_1-70006349.SAR    |
| No                     | SAP_HR608.SAR                   | None                                                                                             |
| Yes                    | SUM20SP16_6-80002456.SAR        | None                                                                                             |

## FAQs

Here are some frequently asked questions:

1. Are the folder names and YAML file names the same?
   - Yes, the folder names and the BOM files within them should have the same name, excluding the file extension.

1. Are the version numbers in the format `v<versionnumber>ms`?
   - Yes, the version numbers should follow the format `v<versionnumber>ms`. 
   - As an example, `v0007ms` is a valid version representing the 7th version of a BOM. 
   - For SWPM and SUM BOMs, the version number `latest` is used outside the archives folder. When a SWPM/SUM BOM is moved to the archives, it is given a version number based on the last version number present in the archives directory.

1. How can I obtain the updated link for a package?
   - Refer to the section on [how to get the updated BOM link](#how-to-get-the-updated-bom-link) for step-by-step instructions.