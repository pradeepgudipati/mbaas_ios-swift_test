# mbaas_ios-swift_test
<h1>A Reference IOS Mobile Application using Axway MBaaS API's.</h1>

<h2>In order to run this application</h2>

<h3>Prerequisites:</h3>

Should have access to API Management Plus Environment This environment includes following components
API Manager/Gateway
API Portal
MBaaS IOS SDK
API Builder (API Runtime Services)
Axway MBaaS
Axway Decison Insight (Optional)
Steps to Download MBaaS IOS SDK

Virtualize Axway MBaaS API's uisng the MBaaS Swagger File or MBaaS Swagger URL in API Manager.
Self register/Login to API Portal.
Create an Application.
Grant access to MBaaS API's to the Application Created.
In the Authorization tab, generate an API Key for the Application Created.
Under API Section, select the MBaaS API's and Download the IOS SDK Client.
Assuming you have the Axway MBaaS IOS SDK.

Pull this project to your Xcode project and just perform below modifications in the project files

Copy the Downloaded SDK folder to "com.axway.arrowmbs" package
Copy the "axway_oauth_v8.aar" to the lib folder.
Open the LoginActivity.java File and update the API Key with the key generated for the application created. SdkClient.getInstance().setApiKey("Applications API Key");
This reference applications verifies the following Axway MBaaS Objects,

"Users",
"Access Control Lists",
"Photos",
