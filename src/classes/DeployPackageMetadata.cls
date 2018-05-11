/*----------------------------------------------------------------------
Name: 		DeployPackageMetadata.cls
Purpose: 	Deploy/Perform Post Install Script of following Metadata using Apex Metadata API:
(1) Automatically add a new custom field "Partner Tier (PartnerTier__c)" on Account page layout "Demo Account Layout"
(2) Automatically create a default Managed package record in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
public with sharing class DeployPackageMetadata{

	/*----------------------------------------------------------------------
    Purpose: 	Create Metadata Container to add automatically:
    (1) A new custom field "Partner Tier (PartnerTier__c)" on Account page layout "Demo Account Layout"
    (2) Create a default Managed package record in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
    Note: Metadata Container acts like a Package.xml file in source code resource
	Parameters: Metadata.DeployResult, Metadata.DeployCallbackContext
	Returns:	None
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/
    public Metadata.DeployContainer buildDeploymentContainer() {
        // Create Metadata Container 
        // (e.g. Project Manifest "or" Package.xml file in Metadata API)
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        
        // Add Metadata for a custom field "Partner Tier (PartnerTier__c)"       
        Metadata.Layout updatedPageLayout = new UpdatePageLayout().buildAccountLayout();
        container.addMetadata(updatedPageLayout);

        // Add Metadata for a default Managed package record   
        Metadata.CustomMetadata defaultCustomMetadataTypeRecord = new SetupPartnerTierConfiguration().createDefaultPackageRecord();
        container.addMetadata(defaultCustomMetadataTypeRecord);        
        
        return container;
    }
    
	/*----------------------------------------------------------------------
    Purpose: 	Deploy Metadata Container with Callback
    Note: Metadata Container acts like a Package.xml file in source code resource
	Parameters: Metadata.DeployResult, Metadata.DeployCallbackContext
	Returns:	None
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/
    public void deploy(Metadata.DeployContainer container) {
        // Create Post Install callback, which is called when the deployment completes
        PostInstallPackageCallback callback = new PostInstallPackageCallback();

        // Deploy the container with the components
        Id asyncResultId = Metadata.Operations.enqueueDeployment(container, callback);
    }

}