# mbaas_ios-swift_test
A Reference Android Mobile Application using Axway MBaaS API's.

In order to run this application

Prerequisites:

Should have access to API Management Plus Environment This environment includes following components
API Manager/Gateway
API Portal
MBaaS Android SDK
API Builder (API Runtime Services)
Axway MBaaS
Axway Decison Insight (Optional)
Steps to Download MBaaS Android SDK

Virtualize Axway MBaaS API's uisng the MBaaS Swagger File or MBaaS Swagger URL in API Manager.
Self register/Login to API Portal.
Create an Application.
Grant access to MBaaS API's to the Application Created.
In the Authorization tab, generate an API Key for the Application Created.
Under API Section, select the MBaaS API's and Download the Android SDK Client.
Assuming you have the Axway MBaaS Android SDK.

Pull this project to your Android Studio and just perform below modifications in the project files

Copy the Downloaded SDK folder to "com.axway.arrowmbs" package
Copy the "axway_oauth_v8.aar" to the lib folder.
Open the LoginActivity.java File and update the API Key with the key generated for the application created. SdkClient.getInstance().setApiKey("Applications API Key");
This reference applications verifies the following Axway MBaaS Objects,

"Users",
"Access Control Lists",
"Chats",
"Checkins",
"Geo Fences",
"Custom Objects",
"Photo Collections",
"Photos",
"Places",
"Push Notifications",
