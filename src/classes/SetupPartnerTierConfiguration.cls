/*----------------------------------------------------------------------
Name: 		SetupPartnerTierConfiguration.cls
Purpose: 	Using Apex Metadata API: Automatically create a default Managed 
            package record in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
public with sharing class SetupPartnerTierConfiguration{

	/*----------------------------------------------------------------------
    Purpose: 	Using Apex Metadata API: Automatically create a default Managed 
                package record in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
	Parameters: None
	Returns:	Metadata.CustomMetadata
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/
    public Metadata.CustomMetadata createDefaultPackageRecord(){

        // Metadata Type: Custom Metadata Type
        Metadata.CustomMetadata defaultPackageRecord = new Metadata.CustomMetadata();
        
        // When you assign namespaces to records, provide full, qualified record names to the app.
        // If both the type and the record are in Namespace, use something like: 
        // customMetadata.fullName = 'Namespace__MetadataTypeName.Namespace__MetadataRecordName'
        defaultPackageRecord.fullName = 'PartnerTierConfiguration__mdt.' + 'Default_Packaged_Record';
        defaultPackageRecord.label = 'Default Packaged Record';
        
        // Populate CustomMetadataValue for "Fee__c" field
        Metadata.CustomMetadataValue feeField = new Metadata.CustomMetadataValue();
        feeField.field = 'Fee__c';
        feeField.value = 0;
        defaultPackageRecord.values.add(feeField);

        // Populate CustomMetadataValue for "Discount__c" field
        Metadata.CustomMetadataValue discountField = new Metadata.CustomMetadataValue();
        discountField.field = 'Discount__c';
        discountField.value = 0;
        defaultPackageRecord.values.add(discountField);

        return defaultPackageRecord;

    }
    
}