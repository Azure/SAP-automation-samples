# Updating BOM Links

1.  [Key points about folder and file structure](#key-points-about-folder-and-file-structure)
1.  [Procedure](#procedure)
1.  [How to get the updated BOM link](#how-to-get-the-updated-bom-link)
1.  [FAQs](#questions)

## Key points about folder and file structure
1.  The folder structure for a BOM is such that the BOM file is contained within a folder that is named with the same name as the BOM file (excluding the file extension).
1.  For ex: HANA_2_00_067_v0003ms.yaml is contained within a folder named HANA_2_00_067_v0003ms.
1.  The folder and file for a particular BOM contains the version number appended to the end of the name. 
    In the example provided in the preceding point, the version number is v0003ms.
1.  The BOM file (in this case HANA_2_00_067_v0003ms.yaml) contains the file name and the version number mentioned at the very beginning of the file. Ex:
    ```yaml
    name:               'HANA_2_00_067_v0003ms'
    target:             'HANA 2.0'
    version:            3
    platform:           'HANA'
    ```
## Procedure

1.  The overall goal is to update BOM files that reference an outdated link.
    This could be a link to a SAP package, SWPM module etc.
    We should also preserve the earlier versions of the file which contain the outdated links.
    For this reason we need to move the outdated files to the archives folder. 
    For updating SWPM and SUM packages make sure to check [this](#procedure-for-swpm-and-sum-files) out once.
1.  Get the new BOM link.
    Click [here](#how-to-get-the-updated-bom-link) to check the procedure for procuring the updated link.
1.  Find the files where the outdated BOM link has been referred to. 
    Let's say there are two files which reference the outdated link - NAME_01_00_v0005ms.yaml, NAME2_02_22_v0004ms.yaml that are present in folders named NAME_01_00_v0005ms and NAME2_02_22_v0004ms.
    Note that each folder and file will have a certain version number that has been appended at the end of the folder name.
    The version is of the format ```v<versionnumber>ms``` as in NAME_01_00_v0005ms.
1.  The folders NAME_01_00_v0005ms, NAME2_02_22_v0004ms need to be copied into to the archives folder (This is done to preserve the previous versions of the BOM file).
1.  Now update the name of the folders and the BOM file contained in the folder so that the version number present at the end of the folder name  and the file name is updated. 
    In this case, the folder names should get updated to NAME_01_00_v0006ms and NAME2_02_22_v0005ms and the file names should get updated to NAME_01_00_v0006ms.yaml NAME2_02_22_v0005ms.yaml.
1.  The files also contain the version number and the file name mentioned within them as shown [here](#key-points-about-folder-and-file-structure). 
    The version number and the file name needs to be updated inside the file too.
    The file name has the version number appended to it and therefore requires an update.

## Procedure for SWPM and SUM files

1.  For the SWPM and the SUM files, the folder and file name has the version number ```latest``` appended to the file and folder name. 
    Example: SUM20SP16_latest.yaml is contained within SUM20SP16_latest folder.
1.  When we copy this folder to the archives directory, we remove the ```latest``` from the file and folder name and replace it with a version number that is greater than the version number of the latest entry of that BOM file in the archives directory.
    For example, Lets say the last BOM directory for SUM20SP16 present in the archives folder is SUM20SP16_v0006.
    This means when we copy SUM20SP16_latest to the archives folder, we will rename it to SUM20SP16_v0007 and the BOM file within it will be renamed as SUM20SP16_v0007.yaml.
1. Once we have copied the SUM / SWPM directory into the archives folder maintining the constraints mentioned in the preceding points, we can simply update the outdated link in the SUM20SP16_latest.yaml in the SUM20SP16_latest folder (The one present outside the archives directory).
1. Increase the version number present in the SUM / SWPM BOM file present in this format:
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

## How to get the updated BOM link

1.  Logon to [SAP Support Portal](https://launchpad.support.sap.com/#/softwarecenter)
1.  Go to Software Downloads
1.  Seach for the file by the archive name of the file excluding the version.
    For Example for SUM20SP16_6-80002456.SAR, search with the package name SUM20SP16.
1.  If there is a later version for this package, that should be the new link for the package.
1.  Make sure that the link for the correct target OS is used. 

## Knowledge Base of dependent packages from previous BOM link updates

|Is installer component  |  Archive name (Example) | Dependent Archive name examples |
|------------------------|-------------------------|------|
| No          |  IMDB_SERVER20_067_1-80002031.SAR | IMDB_AFL20_067_0-80001894.SAR, IMDB_LCAPPS_2067_0-20010426.SAR, VCH202100_2067_1-70006349.SAR, |
| No          |  SAP_HR608.SAR  |  None |
| Yes         | SUM20SP16_6-80002456.SAR | None |


## FAQs
1.  Are the folder names and the yaml file names to be same?
    * Yes the folder names and the BOM files contained within them have the same name excluding the extension for the file name.
1.  Are the version numbers of the format ```v<versionnumber>ms```?
    * Yes the version numbers should be of the format ```v<versionnumber>ms```.
    For example, v0007ms is a valid version.
    For SWPM and SUM BOMs, the version number ```latest``` is used outside of the archives folder.
    When a SWPM / SUM BOM is moved to archives, it is given a version number depending on what the last version number for that BOM was in the archives directory.
1.  How to get the updated link for a package?
    * Check [this](#how-to-get-the-updated-bom-link).





