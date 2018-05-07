/*----------------------------------------------------------------------
Name: 		PostInstallPackageScript.cls
Purpose: 	Deploy/Perform Post Install Script of following Metadata using Apex Metadata API:
(1) Automatically add a new custom field "Partner Tier (PartnerTier__c)" on Account page layout "Demo Account Layout"
(2) Automatically create a default Managed package record in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
public with sharing class PostInstallPackageScript implements InstallHandler{

	/*----------------------------------------------------------------------
    Purpose: 	Run Post Install Script to automatically:
    (1) Add a new custom field "Partner Tier (PartnerTier__c)" on Account page layout "Demo Account Layout"
    (2) Create a default Managed package record in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
    Parameters: Metadata.DeployResult, Metadata.DeployCallbackContext
	Returns:	None
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/
    public void onInstall(InstallContext context) {
        // Run Post Package Installation Script
        DeployPackageMetadata deployPacakge = new DeployPackageMetadata();
        Metadata.DeployContainer container = deployPacakge.buildDeploymentContainer();
        deployPacakge.deploy(container);
    }
    
}