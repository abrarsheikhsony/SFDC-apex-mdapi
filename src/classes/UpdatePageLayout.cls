/*----------------------------------------------------------------------
Name: 		UpdatePageLayout.cls
Purpose: 	Using Apex Metadata API: Automatically add a new custom field 
            "Partner Tier (PartnerTier__c)" on Account page layout "Demo Account Layout"
------------------------------History----------------------------------
Version 	Author 		        Date 					Detail Description 
-------		--------------      -----------------       ------------------
1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
----------------------------------------------------------------------*/
public with sharing class UpdatePageLayout{

	/*----------------------------------------------------------------------
	Purpose: 	Using Apex Metadata API: Automatically add a new custom field 
	            "Partner Tier (PartnerTier__c)" on Account page layout "Demo Account Layout"
	Parameters: None
	Returns:	Metadata.Layout
    ------------------------------History----------------------------------
    Version 	Author 		        Date 					Detail Description 
    -------		--------------      -----------------       ------------------
    1.0 		Muhammad Abrar 		10-May-2018	            Initial Development	
    ----------------------------------------------------------------------*/
    public Metadata.Layout buildAccountLayout() {
        
        // The new custom field to be added in a page layout Demo Account Layout
        List<String> lstPageLayouts = new List<String>{ 'Account-Demo Account Layout' };

        // Retrieve metadata (sections + columns + items) of Account page layout "Demo Account Layout"
        List<Metadata.Metadata> pageLayouts = Metadata.Operations.retrieve(Metadata.MetadataType.Layout, lstPageLayouts);

        // Metadata Type: Page Layout
        Metadata.Layout pageLayoutMetadata = (Metadata.Layout) pageLayouts.get(0);

        Metadata.LayoutSection layoutSectionToEdit = null;
        
        List<Metadata.LayoutSection> layoutSections = pageLayoutMetadata.LayoutSections;

        for (Metadata.LayoutSection section : layoutSections) {
            // Get a page layout section "Partner Information"
            if (section.label == 'Partner Information') {
                layoutSectionToEdit = section;
                break;
            }
        }
        
        // Retrieve section columns
        List<Metadata.LayoutColumn> layoutColumns = layoutSectionToEdit.LayoutColumns;     
        
        if( layoutColumns.get(0).LayoutItems == null ){
            layoutColumns.get(0).LayoutItems = new List<Metadata.LayoutItem>();
        }
        
        List<Metadata.LayoutItem> layoutItems = layoutColumns.get(0).LayoutItems;
        
        Metadata.LayoutItem item = new Metadata.LayoutItem();

        // Describes the behavior for a layout item on a layout page.
        // Values of the Metadata.UiBehavior enum (Edit, Readonly, Required)
        item.behavior = Metadata.UiBehavior.Edit;
        // Add a custom field "PartnerTier__c" in layout section column
        item.field = 'PartnerTier__c';
        layoutItems.add(item);
        
        return pageLayoutMetadata;

    }
    
}