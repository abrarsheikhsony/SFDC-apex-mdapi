/*----------------------------------------------------------------------
Name: 		SetupParentChildCustomMetadataTypes.cls
Purpose: 	Create a parent and child custom metadata type records Synchronously (in a single transaction)
            ParentCMT__mdt
            ChildCMT__mdt
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
public with sharing class SetupParentChildCustomMetadataTypes{

	/*----------------------------------------------------------------------
    Purpose: 	Create a parent and child custom metadata type records Synchronously (in a single transaction)
                ParentCMT__mdt
                ChildCMT__mdt
	Parameters: None
	Returns:	None
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/
    public void createParentChildCMTRecords(){

        Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
 
        // Create Parent record
        Metadata.CustomMetadata parentRecord = new Metadata.CustomMetadata();
        parentRecord.fullName = 'ParentCMT__mdt.' + 'TEST_PARENT_RECORD';
        parentRecord.label = 'TEST PARENT RECORD';

        Metadata.CustomMetadataValue totalChildField = new Metadata.CustomMetadataValue();
        totalChildField.field = 'TotalChilds__c';
        totalChildField.value = 10;
        parentRecord.values.add(totalChildField);

        mdContainer.addMetadata(parentRecord);
 
        // Create Child record
        Metadata.CustomMetadata childRecord = new Metadata.CustomMetadata();
        childRecord.fullName = 'ChildCMT__mdt.' + 'TEST_CHILD_RECORD';
        childRecord.label = 'TEST CHILD RECORD';

        Metadata.CustomMetadataValue activeField = new Metadata.CustomMetadataValue();
        activeField.field = 'IsActive__c';
        activeField.value = true;
        childRecord.values.add(activeField);

        Metadata.CustomMetadataValue parentLookupField = new Metadata.CustomMetadataValue();
        parentLookupField.field = 'ParentCMT__c';
        // When setting the value for relationship fields, use the Qualified API name of the related metadata, not the ID.
        parentLookupField.value = 'TEST_PARENT_RECORD';
        childRecord.values.add(parentLookupField);
        
        mdContainer.addMetadata(childRecord);
 
        Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, null);

    }
    
}