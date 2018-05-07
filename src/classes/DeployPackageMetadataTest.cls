/*----------------------------------------------------------------------
Name: 		DeployPackageMetadataTest.cls
Purpose: 	Testing following classese
            1. DeployPackageMetadata
            2. UpdatePageLayout
            3. SetupPartnerTierConfiguration
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
@isTest
private class DeployPackageMetadataTest {

    @isTest
    static void testDeployment() {
        DeployPackageMetadata deployMd = new DeployPackageMetadata();

        Metadata.DeployContainer container = deployMd.buildDeploymentContainer();

        List<Metadata.Metadata> contents = container.getMetadata();
        System.assertEquals(2, contents.size());

        Metadata.Layout layout = (Metadata.Layout) contents.get(0);
        Metadata.CustomMetadata customMetadataType = (Metadata.CustomMetadata) contents.get(1);
       
        // Perform various assertions the layout metadata.
        System.assertEquals('Account-Demo Account Layout', layout.fullName);
        System.assertEquals('PartnerTierConfiguration__mdt.' + 'Default_Packaged_Record', customMetadataType.fullName);
    }
    
}