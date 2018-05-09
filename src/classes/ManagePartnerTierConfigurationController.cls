/*----------------------------------------------------------------------
Name: 		PartnerTierConfigurationController.cls
Purpose: 	Using Apex Metadata API: Build a custom Setup UI and Create/Update
            records in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
public with sharing class ManagePartnerTierConfigurationController{

    public String selectedTier {get;set;}
    public Boolean displayConfirmationMessage {get; set;}
    public PartnerTierConfiguration__mdt partnerTierConfiguration {get; set;}
    public final List<PartnerTierConfiguration__mdt> lstPartnerTierConfiguration {get; set;}
    final Map<String, PartnerTierConfiguration__mdt> mapPartnerTierConfiguration {get; set;} 
    
    public ManagePartnerTierConfigurationController(){
        displayConfirmationMessage = false;
        partnerTierConfiguration = new PartnerTierConfiguration__mdt();
        lstPartnerTierConfiguration = new List<PartnerTierConfiguration__mdt>();
        mapPartnerTierConfiguration = new Map<String, PartnerTierConfiguration__mdt>();
        getPartnerTierConfigurationRecords();
    }

    public List<SelectOption> getTiers() {
        List<SelectOption> tierOptions = new List<SelectOption>();

        tierOptions.add(new SelectOption('','-Select Tier-'));
        tierOptions.add(new SelectOption('GlobalStrategic','Global Strategic'));
        tierOptions.add(new SelectOption('Platinum','Platinum'));
        tierOptions.add(new SelectOption('Gold','Gold'));
        tierOptions.add(new SelectOption('Silver','Silver'));
        tierOptions.add(new SelectOption('Bronze','Bronze'));

        return tierOptions;
    }

	/*----------------------------------------------------------------------
	Purpose: 	Create a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
	Parameters: None
	Returns:	PageReference
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/ 
    public PageReference createPartnerTierConfigurationRecord(){
        // Metadata - Custom Metadata Type
        Metadata.CustomMetadata partnerTierConfigurationCMT =  new Metadata.CustomMetadata();
        partnerTierConfigurationCMT.fullName = 'PartnerTierConfiguration__mdt.' + selectedTier.deleteWhitespace();
        partnerTierConfigurationCMT.label = selectedTier;
        
        // Populate Fee__c field
        Metadata.CustomMetadataValue feeField = new Metadata.CustomMetadataValue();
        feeField.field = 'Fee__c';
        feeField.value = partnerTierConfiguration.Fee__c;
        partnerTierConfigurationCMT.values.add(feeField);

        // Populate Discount__c field
        Metadata.CustomMetadataValue discountField = new Metadata.CustomMetadataValue();
        discountField.field = 'Discount__c';
        discountField.value = partnerTierConfiguration.Discount__c;
        partnerTierConfigurationCMT.values.add(discountField);
        
        // Add a New record into a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        container.addMetadata(partnerTierConfigurationCMT);

        // Create Post Install callback, which is called when the deployment completes
        PostInstallPackageCallback callback = new PostInstallPackageCallback();
        
        displayConfirmationMessage = true;
        
        // Deploy the container with the new components. 
        Id asyncResultId = Metadata.Operations.enqueueDeployment(container, callback);
        System.Debug('>>Create asyncResultId<<'+asyncResultId);

        return null;
    }

	/*----------------------------------------------------------------------
	Purpose: 	Query and get records for custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
	Parameters: None
	Returns:	PageReference
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/     
    @TestVisible
    private void getPartnerTierConfigurationRecords(){
        List<PartnerTierConfiguration__mdt> lstPartnerTierRecords = [SELECT Id, NamespacePrefix, DeveloperName, QualifiedApiName, MasterLabel, Label, Fee__c, Discount__c, Language FROM PartnerTierConfiguration__mdt];
        for(PartnerTierConfiguration__mdt partnerTierRecord : lstPartnerTierRecords){
            lstPartnerTierConfiguration.add(partnerTierRecord);
            mapPartnerTierConfiguration.put(partnerTierRecord.QualifiedApiName, partnerTierRecord);
        }
    }

	/*----------------------------------------------------------------------
	Purpose: 	Update multiple records of custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
	Parameters: None
	Returns:	PageReference
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/ 
    public PageReference updatePartnerTierConfigurationRecords(){
        List<String> lstPartnerTiers = new List<String>();

        for(String partnerTier : mapPartnerTierConfiguration.keySet()){
            lstPartnerTiers.add('PartnerTierConfiguration__mdt.'+partnerTier);
        }

        // Create a metadata container.
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        
        List<Metadata.Metadata> records = Metadata.Operations.retrieve(Metadata.MetadataType.CustomMetadata, lstPartnerTiers);
        
        for (Metadata.Metadata record : records) {
            Metadata.CustomMetadata vatRecord = (Metadata.CustomMetadata) record;
            String vatRecordName = vatRecord.fullName.substringAfter('.');
            PartnerTierConfiguration__mdt vatToCopy = mapPartnerTierConfiguration.get(vatRecordName);
            
            for (Metadata.CustomMetadataValue vatRecValue : vatRecord.values) {
                vatRecValue.value = vatToCopy.get(vatRecValue.field);
            }
            
            // Add record to the container.
            container.addMetadata(vatRecord);
        }   

        // Create Post Install callback, which is called when the deployment completes
        PostInstallPackageCallback callback = new PostInstallPackageCallback();
                
        displayConfirmationMessage = true;

        // Deploy the container with the new components. 
        Id asyncResultId = Metadata.Operations.enqueueDeployment(container, callback);
        System.Debug('>>Update asyncResultId<<'+asyncResultId);

        return null;
    }
    
}