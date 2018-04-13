# mbaas_ios-swift_test

# A Reference IOS Mobile Application using Axway MBaaS API's.</h1> #

## In order to run this application ##

### Prerequisites: ###

* Should have access to API Management Plus Environment This environment includes following components
  * API Manager/Gateway
  * API Portal
     * MBaaS IOS-SWIFT SDK Generator
  * API Builder (API Runtime Services)
  * Axway MBaaS
  * Axway Decison Insight (Optional)
  
Steps to Download MBaaS IOS SDK

* Virtualize Axway MBaaS API's uisng the MBaaS Swagger File or MBaaS Swagger URL in API Manager.
* Self register/Login to API Portal.
  * Create an Application.
  * Grant access to MBaaS API's to the Application Created.
  * In the Authorization tab, generate an API Key for the Application Created.
* Under API Section, select the MBaaS API's and Download the IOS SDK Client.

## Assuming you have the Axway MBaaS IOS SDK. ##

Pull this project to your Xcode project and make the below modifications in the project files

  1. Copy the Downloaded SDK folder to project
  2. Check mark - Copy items if needed, Check mark add to targets
  3. Open AppDelegate.swift and add sharedInstance.apiKey = "Applications API Key"

This reference applications verifies the following Axway MBaaS Objects

  1. "Users"
  2. "Access Control Lists"
  3. "Chats"
  4. "Push Notifications"
  5. "Places"
  6. "Geo Fences"
  7. "Checkins"
  8. "Photos"
  9. "Photo Collections"
  10. "Custom Objects"
  
