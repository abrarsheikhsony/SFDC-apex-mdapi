# Apex Metadata API

## Presentation deck of "Make Awesome Admins Happy with the Apex Metadata API" from Salesforce World Tour London 17 May 2018
<a href="https://www.slideshare.net/secret/CjvJYDcjZ8Uqjg" target="_blank" alt="Make Awesome Admins Happy with the Apex Metadata API">Make Awesome Admins Happy with the Apex Metadata API</a>

## What is Apex Metadata API?
It allows you to make metadata changes directly from Apex.

## Currently limited to two (2) metadata types:
<ol type="1">
<li>Custom Metadata Types – Read, Create, Update records</li>
<ol type="a">
<li>Previously done by Force.com open source project = https://github.com/forcedotcom/CustomMetadataLoader</li>
</ol>
<li>Page Layouts (Read / Update) – Add fields to page layouts</li>
</ol>

## Sample code with Use Cases
In this project, you have mainly 2 use cases with the sample code of Apex Metadata API.
<ol type="1">
<li>Use Case 1 - As an ISV you upgrade a package that includes a new custom field “Partner Tier (PartnerTier__c)” on Account object. Customer wants that field automatically added on a common shared Account page layout “Demo Account Layout” after the package upgrades.
</li>
<li>Use Case 2 - As an ISV / Consulting Partner, you want to give Admins a customized and easy to use setup UI to Read, Create and Update records in a custom metadata type “Partner Tier Configuration (PartnerTierConfiguration__mdt)”.
</li>
</ol>

## Development Components
The package has following development components.
<ol type="1">
<li>A custom Picklist field “Partner Tier (PartnerTier__c)” on Account object</li>
<li>An Account page layout “Demo Account Layout”</li>
<li>A custom metadata type “Partner Tier Configuration (PartnerTierConfiguration__mdt)”</li>
<li>Apex Classes</li>
<ol type="a">  
<li>DeployPackageMetadata</li>
<li>DeployPackageMetadataTest</li>
<li>PostInstallPackageCallback</li>
<li>PostInstallPackageCallbackTest</li>
<li>PostInstallPackageScript</li>
<li>SetupPartnerTierConfiguration</li>
<li>UpdatePageLayout</li>
<li>ManagePartnerTierConfigurationController</li>
<li>SetupParentChildCustomMetadataTypes</li>
<li>SetupKPIConfiguration</li>
<li>ManageKPIConfigurationMetadata</li>
<li>ManageKPIConfigurationMetadataTest</li>
</ol>
<li>Visualforce Pages</li>
<ol type="a">
<li>ManagePartnerTierConfiguration</li>
</ol>
<li>A custom Visualforce tab "Manage Partner Tier Configuration"</li>
</ol>

## Validate Use Cases
To validate Use Case 1: Run the below code snippet from an Apex class "PostInstallPackageScript" in the Developer Console. It will:

<ol type="1">
<li>
Add a new custom field "Partner Tier (PartnerTier__c)" on Account page layout "Demo Account Layout"
</li>
<li>
Create a default Managed package record in a custom metadata type "Partner Tier Configuration (PartnerTierConfiguration__mdt)"
</li>
</ol>

```
DeployPackageMetadata deployPacakge = new DeployPackageMetadata();
Metadata.DeployContainer container = deployPacakge.buildDeploymentContainer();
deployPacakge.deploy(container);
```

```
ManageKPIConfigurationMetadata deployPacakge = new ManageKPIConfigurationMetadata();
Metadata.DeployContainer container = deployPacakge.buildDeploymentContainer();
deployPacakge.deploy(container);
```

To validate Use Case 2: Create a Visualforce page using code snippet of "ManagePartnerTierConfiguration.page" and an Apex class "ManagePartnerTierConfigurationController"

## How to create Parent and Child Custom Metadata Types Synchronously (in a single transaction)?
In this package, an Apex class <b>"SetupParentChildCustomMetadataTypes"</b> has a sample code to show you, how you can synchronously in a single transaction create Parent and Child custom metadata type records.

## Look & Feel in Salesforce
<ol type="1">
<li>Account detail page</li>
<img src="supportedimages/AccountDetailPage.png" />
<li>Custom Metadata Type object detail page</li>
<img src="supportedimages/CMT_PartnerTierConfigurationDetailPage.png" />
<li>Custom Metadata Type object records</li>
<img src="supportedimages/CMT_PartnerTierConfigurationRecords.png" />
<li>Visualforce to manage (Create & Update) Custom Metadata Type records</li>
<img src="supportedimages/ManagePartnerTierConfiguration.png" />
<li>Deployment Status page</li>
<img src="supportedimages/DeploymentStatus.png" />
<li>View Setup Audit Trail</li>
<img src="supportedimages/SetupAuditTrail.png" />
</ol>
  
## Background / Evolution Useful Resources
<ol type="1">
  
<li><a href="https://andyinthecloud.com/2013/10/27/introduction-to-calling-the-metadata-api-from-apex/" target="_blank" alt="Calling the Salesforce Metadata API from Apex">Calling the Salesforce Metadata API from Apex</a></li>

<li><a href="https://github.com/financialforcedev/apex-mdapi" target="_blank" alt="Apex Wrapper Salesforce Metadata API">Apex Wrapper Salesforce Metadata API</a></li>

<li><a href="https://help.salesforce.com/articleView?id=custommetadatatypes_dataloader.htm&type=5" target="_blank" alt="Custom Metadata Loader">Custom Metadata Loader</a></li>

<li><a href="https://success.salesforce.com/ideaView?id=08730000000l4TkAAI" target="_blank" alt="Idea - Ability to update Metadata from Apex (Apex Metadata API)">Idea - Ability to update Metadata from Apex (Apex Metadata API)</a></li>

</ol>

## Apex Metadata API Useful Resources
<ol type="1">
  
<li><a href="https://developer.salesforce.com/blogs/engineering/2017/05/introducing-apex-metadata-api.html" target="_blank" alt="Introducing the Apex Metadata API">Introducing the Apex Metadata API</a></li>

<li><a href="https://developer.salesforce.com/blogs/engineering/2017/06/apex-metadata-api-security.html" target="_blank" alt="Apex Metadata API and Security">Apex Metadata API and Security</a></li>

<li><a href="https://releasenotes.docs.salesforce.com/en-us/summer17/release-notes/rn_apex_metadata.htm" target="_blank" alt="Summer '17 Release Notes">Summer '17 Release Notes</a></li>

<li><a href="https://trailhead.salesforce.com/modules/apex_metadata_api" target="_blank" alt="Trailhead Module: Apex Metadata API">Trailhead Module: Apex Metadata API</a></li>

<li><a href="https://developer.salesforce.com/docs/atlas.en-us.214.0.apexcode.meta/apexcode/apex_metadata.htm" target="_blank" alt="Apex Developer Guide - Metadata namespace">Apex Developer Guide - Metadata namespace</a></li>

<li><a href="https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_namespace_Metadata.htm" target="_blank" alt="Apex Developer Guide - All classes under Metadata Namespace">Apex Developer Guide - All classes under Metadata Namespace</a></li>

</ol>

## Salesforce Developers Sessions on YouTube
<ol type="1">

<li><a href="https://www.youtube.com/watch?v=Sfnrrf9toEg" target="_blank" alt="Session by Salesforce: Build Custom Setup Apps & Config Tools with the All-New Apex Metadata API">Session by Salesforce: Build Custom Setup Apps & Config Tools with the All-New Apex Metadata API</a></li>

<li><a href="https://www.youtube.com/watch?v=Wa3PJM8APfg" target="_blank" alt="Session by Salesforce: Build Custom Setup Apps & Config Tools With the All-New Apex Metadata API">Session by Salesforce: Build Custom Setup Apps & Config Tools With the All-New Apex Metadata API</a></li>

<li><a href="https://www.youtube.com/watch?v=LGTOjrgv_os" target="_blank" alt="Session by Customers: Getting Started with the New Apex Metadata API">Session by Customers: Getting Started with the New Apex Metadata API</a></li>

<li><a href="https://www.youtube.com/watch?v=5yEbsc_ocLI" target="_blank" alt="Session by Customers: Build Self-Configuring Apps With the Apex Metadata API (1)">Session by Customers: Build Self-Configuring Apps With the Apex Metadata API (1)</a></li>

<li><a href="https://www.youtube.com/watch?v=bwz65OYbkA4" target="_blank" alt="Session by Customers: Build Self-Configuring Apps With the Apex Metadata API (2)">Session by Customers: Build Self-Configuring Apps With the Apex Metadata API (2)</a></li>

</ol>

## Join Salesforce Success Community
<ol type="1">

<li><a href="https://success.salesforce.com/0F930000000PbSh" target="_blank" alt="Join "Apex Metadata API" group in the Success Community for Updates">Join "Apex Metadata API" group in the Success Community for Updates</a></li>

</ol>
