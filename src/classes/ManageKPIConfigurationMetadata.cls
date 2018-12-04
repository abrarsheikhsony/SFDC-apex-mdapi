
public with sharing class ManageKPIConfigurationMetadata{

    public Metadata.DeployContainer buildDeploymentContainer() {
        // Create Metadata Container 
        // (e.g. Project Manifest "or" Package.xml file in Metadata API)
        Metadata.DeployContainer container = new Metadata.DeployContainer();

        // Add Metadata for a default Managed package record   
        Metadata.CustomMetadata createKPIConfigurationRecord = new SetupKPIConfiguration().buildKPIConfigurationRecord();
        container.addMetadata(createKPIConfigurationRecord);        
        
        return container;
    }


    public void deploy(Metadata.DeployContainer container) {
        // Create Post Install callback, which is called when the deployment completes
        PostInstallPackageCallback callback = new PostInstallPackageCallback();

        // Deploy the container with the components
        Id asyncResultId = Metadata.Operations.enqueueDeployment(container, callback);
    }
    
}