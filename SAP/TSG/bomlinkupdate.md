# Updating BOM Links

1.  [Questions](#questions)
1.  [Key points about folder and file structure](#key-points-about-folder-and-file-structure)
1.  [Procedure](#procedure)
1.  [How to get the updated BOM link](#how-to-get-the-updated-bom-link)

## Questions
1.  Are the folder names and the yaml file names to be same?
1.  Are the version numbers of the format ```v<versionnumber>ms```?
1.  What kind of link is the link to the file. What should I call it? link to SAP package?
1.  Can I make a reference to the BOM validator pipeline even though it is not visible outside microsoft but the samples repo is? 
1.  Which link should be used as the updated link? Should it be the latest one for Linux on x86_64 64bit? If so then why did we not update one of the packages today? Was it because the previous version was still available to download? So as long as the previous version is available to download, we will not update the bom link is it?

## Key points about folder and file structure
1.  The folder structure for a BOM is such that the BOM file is contained within a folder that is named with the same name as the BOM file (excluding the file extension).
1.  For ex: HANA_2_00_067_v0003.yaml is contained within a folder named HANA_2_00_067_v0003.
1.  The folder and file for a particular BOM contains the version number appended to the end of the name. 
    In the example provided in the preceding point, the version number is v0003.
1.  The BOM file (in this case HANA_2_00_067_v0003.yaml) contains the file name and the version number mentioned at the very beginning of the file. Ex:
    ```yaml
    name:               'HANA_2_00_067_v0003ms'
    target:             'HANA 2.0'
    version:            3
    platform:           'HANA'
    ```
## Procedure

1.  The overall goal is to update BOM files that reference an outdated link.
    This could be a link to a SAP package, SWPM module etc.
    We should also preserve the earlier versions of the file which contain the outdated links for book-keeping purposes.
    For this reason we need to move the outdated files to the archives folder.
1.  Get the new BOM link.
    Click [here](#how-to-get-the-updated-bom-link) to check the procedure for procuring the updated link.
1.  Find the files where the outdated BOM link has been referred to. 
    Let's say there are two files which reference the outdated link - NAME_01_00_v0005ms.yaml, NAME2_02_22_v0004ms.yaml that are present in folders named NAME_01_00_v0005ms and NAME2_02_22_v0004ms.
    Note that each folder and file will have a certain version number that has been appended at the end of the folder name.
    The version is of the format ```v<versionnumber>ms``` as in NAME_01_00_v0005ms. XXX(What other files can be )
1.  The folders NAME_01_00_v0005ms, NAME2_02_22_v0004ms need to be copied into to the archives folder (This is done to preserve the previous versions of the BOM file).
1.  Now update the name of the folders and the BOM file contained in the folder so that the version number present at the end of the folder name  and the file name is updated. 
    In this case, the folder names should get updated to NAME_01_00_v0006ms and NAME2_02_22_v0005ms and the file names should get updated to NAME_01_00_v0006ms.yaml NAME2_02_22_v0005ms.yaml.
1.  The files also contain the version number and the file name mentioned within them as shown [here](#key-points-about-folder-and-file-structure). 
    The version number and the file name needs to be updated inside the file too.

## How to identify that a BOM link has expired

When a BOM link expires, the BOM validator pipeline will fail. If we check the failure logs, we can figure out which package has expired. All the files where the outdated package has been referred to should then be updated with the new link.

## How to get the updated BOM link

1.  Logon to [SAP Support Portal](https://launchpad.support.sap.com/#/softwarecenter)
1.  Go to Software Downloads
1.  Seach for the file by the archive name of the file excluding the version.
    For Example for SUM20SP16_6-80002456.SAR, search with SUM20SP16 XXX(What is this called? Package name?).
    XXX(This can be obtained from the BOM validator pipeline failure) 

## List of dependent packages


|Is installer component  |  Archive name (Example) | Dependent Archive name examples | Search links for relevant packages| Potential regressions | List of files to be updated
|------------------------|-------------------------|------|------|-----|-----|
| No          |  IMDB_SERVER20_067_1-80002031.SAR | HANA Server | IMDB_AFL20_067_0-80001894.SAR, IMDB_LCAPPS_2067_0-20010426.SAR, VCH202100_2067_1-70006349.SAR, | None | List of files |
| No          |  SAP_HR  |  Dependent Packages | Search Links |  None  | List of files to be updated




