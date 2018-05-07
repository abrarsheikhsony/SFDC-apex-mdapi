/*----------------------------------------------------------------------
Name: 		PostInstallPackageCallbackTest.cls
Purpose: 	Testing "PostInstallPackageCallback" class
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
@isTest
private class PostInstallPackageCallbackTest {

    @isTest
    static void testMyCallback() {
        // Instantiate the callback.
        Metadata.DeployCallback callback = new PostInstallPackageCallback();
        
        // Create test result and context objects.
        Metadata.DeployResult result = new Metadata.DeployResult();
        result.numberComponentErrors = 2;
        Metadata.DeployCallbackContext context = new Metadata.DeployCallbackContext();
        
        // Invoke the callback's handleResult method.
        callback.handleResult(result, context);
    }

}