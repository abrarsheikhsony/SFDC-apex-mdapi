
@isTest
private class ManageKPIConfigurationMetadataTest{

    @testSetup
    static void setupCommonData(){
        // Apex test classes can see custom metadata types and access their fields and records
        List<KPIConfiguration__mdt> listKPIConfigurationRecords = [SELECT Id, QualifiedAPIName, IsActive__c, KPICode__c, SalesOrg__c FROM KPIConfiguration__mdt];        
        System.assertEquals(1, listKPIConfigurationRecords.size());
        
        ManageKPIConfigurationMetadata createKPIConfigurationRecord = new ManageKPIConfigurationMetadata();

        Metadata.DeployContainer container = createKPIConfigurationRecord.buildDeploymentContainer();

        List<Metadata.Metadata> contents = container.getMetadata();
        System.assertEquals(1, contents.size());

        Metadata.CustomMetadata customMetadataType = (Metadata.CustomMetadata) contents.get(0);
       
        // Perform assertions
        System.assertEquals('KPIConfiguration__mdt.' + 'SoCo', customMetadataType.fullName);
        
    }
    
    @isTest
    static void queryKPIConfigurationRecords(){

        List<KPIConfiguration__mdt> listKPIConfigurationRecords = [SELECT Id, QualifiedAPIName, IsActive__c, KPICode__c, SalesOrg__c FROM KPIConfiguration__mdt];        
        System.assertEquals(1, listKPIConfigurationRecords.size());
        
    }
        
}