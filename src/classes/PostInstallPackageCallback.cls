/*----------------------------------------------------------------------
Name: 		PostInstallPackageCallback.cls
Purpose: 	Implement callback because the Metadata deployment is Asynchronous
            and we are notified when the queued deployment completes.
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
public with sharing class PostInstallPackageCallback implements Metadata.DeployCallback{

	/*----------------------------------------------------------------------
    Purpose: 	Implement callback because the Metadata deployment is Asynchronous
                and we are notified when the queued deployment completes.
	Parameters: Metadata.DeployResult, Metadata.DeployCallbackContext
	Returns:	None
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/
    public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context) {

        if (result.Status == Metadata.DeployStatus.Succeeded) {
            // Deployment was successful
            System.Debug('>>Deployment Succeeded<<');
            System.Debug('>>Deployment Succeeded: Id<<'+result.Id);
            System.Debug('>>Deployment Succeeded: Status<<'+result.Status);
            System.Debug('>>Deployment Succeeded: Done<<'+result.Done);
            System.Debug('>>Deployment Succeeded: Success<<'+result.Success);
            
            // Further processing... Send a confirmation email etc.
        }
        else {
            // Deployment wasn’t successful
            System.Debug('>>Deployment Failed: Id<<'+result.Id);
            System.Debug('>>Deployment Succeeded: Status<<'+result.Status);
            System.Debug('>>Deployment Failed: errorStatusCode - errorMessage<<'+result.errorStatusCode + '---' + result.errorMessage);

            // Further processing... Send an email etc.
        }

    }

}