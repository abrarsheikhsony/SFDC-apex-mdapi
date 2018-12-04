
public with sharing class SetupKPIConfiguration{

    public Metadata.CustomMetadata buildKPIConfigurationRecord(){

        Metadata.CustomMetadata socoRecord = new Metadata.CustomMetadata();

        socoRecord.fullName = 'KPIConfiguration__mdt.' + 'SoCo';
        socoRecord.label = 'SoCo';
        
        // Populate CustomMetadataValue for "IsActive__c" field
        Metadata.CustomMetadataValue activeField = new Metadata.CustomMetadataValue();
        activeField.field = 'IsActive__c';
        activeField.value = true;
        socoRecord.values.add(activeField);

        // Populate CustomMetadataValue for "KPICode__c" field
        Metadata.CustomMetadataValue kpiCodeField = new Metadata.CustomMetadataValue();
        kpiCodeField.field = 'KPICode__c';
        kpiCodeField.value = 'SoCo';
        socoRecord.values.add(kpiCodeField);

        // Populate CustomMetadataValue for "SalesOrg__c" field
        Metadata.CustomMetadataValue salesOrgField = new Metadata.CustomMetadataValue();
        salesOrgField.field = 'SalesOrg__c';
        salesOrgField.value = 'SoCo';
        socoRecord.values.add(salesOrgField);

        return socoRecord;
    
    }    
    
}