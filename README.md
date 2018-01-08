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
  . Create an Application.
  . Grant access to MBaaS API's to the Application Created.
  . In the Authorization tab, generate an API Key for the Application Created.
* Under API Section, select the MBaaS API's and Download the IOS SDK Client.

## Assuming you have the Axway MBaaS IOS SDK. ##

Pull this project to your Xcode project and make the below modifications in the project files

  1. Copy the Downloaded SDK folder to project
  2. Check mark - Copy items if needed, Check mark add to targets
  3. Open AppDelegate.swift and add sharedInstance.apiKey = "Applications API Key"

This reference applications verifies the following Axway MBaaS Objects

  1. "Users":
 
                  Create User : User has to enter his/her details to create a profile
                  
                  Login User : Using created user credentails user has to login into the app which in return maintains a session id
                  
                  Show Current User : Will display the details of current user
                  
                  Update Current User : This will prefill the details of current logged in user where you update the required details of it and then submit
                  
                  Remove User : To delete specific user we can use this api and this will be done by entering an emailid which you want to delete.
                  
                  Logout Current User : It will logout the existing user by having the userid which is already previously logged in.
                  
                  Query User : Need to pass key and value here key will be the where class and value would be any information that you want to search.
                  
  
  2. "Access Control Lists"
  
         CreateACl : To create an access control we have to enter the name that we would like to provide for it
                  
                       * Select Readers: This will display the list of users registered till now from those you can choose any number users and give them access only to read the information.
                  
                       * Select Writers: This will display the list of users registered till now from those you can choose any number users and give them access to write the information.
                  
                       * Create ACL: Upon choosing both readers,writers know you can click on create ACL from which you can create the acess control list
                       
         Show ACL : Enter the ACL name that you would like to see the information off and then click on show ACL which will display the information of readers and writers selected for that ACL
         
                       * Select Readers: This will display the selected readers list which are selected for this ACL
         
                       * Select Writers: This will display the selected writers list which are selected for this ACL
                       
                       * Show ACL: It will display the information of ACL
                       
                       * Delete ACL: To remove ACL that you have created you can use this option
                       
                       
         Update Users in ACL: Enter the ACL name that you want to update and then modify selected readers,writer and click on update
         
                     * Select Readers: This will display the list of users registered till now from those you can choose any number users and give them access only to read the information.
         
                     * Select Writers: This will display the list of users registered till now from those you can choose any number users and give them access to write the information.
         
                     * Update ACL: On modifying the created information just click on update option to update the data of an ACL
                     
                     * Remove User: This will remove the users selected under readers,writers from the existing ACL
      
         Check Permisssions: On enterin the ACL name it will display the permission of ACL
         
  3. "Chats"
  
         Query Chat Group: It wil display list of all chats where you can choose one chat group and navigate furthet to continue chatting this api is used to display the list of chat groups present till now.
         
         swipe to delete will delete the chat that you would like to delete from list of chats
         
         Create New Group: List of registered users will be displayed from where you can just choose number of users that you would like to choose to create a group and start chatting.
         
         It also consists of list of all chat groups which are created till now
  
  
  4. "Checkins"
  
          Create Checkin: Displays list of all places that are created till now and then you can choose a particular place where a checkin will be created for the user who is logged in.
          
          Query Checkin: List of all checked in places of current user will be diaplyed upon choosing a particular checkin its response state gets displayed.
  
  5. "Geo Fences"
  
          Create Geo Fence: User has to enter the given inputs like place,latitude,longitude,radius to create a geo fence
          
          Query Geo Fence: Displayes list of all geofences created till know from where you need to choose a particular place and then update details of the created geo fence
          
          Swipe to delete will help to delete the created geo fence
          
  6. "Custom Objects"
  
          Create Custom Object: User has to enter the name of custom object and choose new property to add a property and then create a custom object
          
          Query Custom Object: Enter class name and click on query will display list of all custom objects and from that choose an object to update the details
          
          Swipe to delete will help to delete the created custom object
          
  
  7. "Photo Collections"
  
         Create Photo Collection: Enter a photo collection name and also tap on choose photo collection to select the existing photo collection and then tap on create to create a new collecton
 
         Search Photo Collection: Displays list of photo collections where in choosing a single photo collection displays an options of
         
            Show photos present in current collection
            Show sub collection in current collectionan
            Update option to update the name of photo collection
            Remove option to delete the existing photo collection
  
  
  8. "Photos"
  
         Create Photo:
         
                 * Select photo from gallery: This will display the list photos present in gallery where in you have to choose one picture.
         
                 * Take photo with camera: Allows to take picture from camera option available in your phone and then uploads to the api
         
                 * Choose Collection: Displays list of collections which are being created till now
         
                 * Create : It will create the photo collection from where the list of photos are ebing selected
         
         Query Photo:
         
                  Displays list of photos that are being uploaded from which you can have an option of update and delete
                  Update will allows you to upload a new picture
                  Delet will helps in deleting the existing photo
  
  9. "Places"
  
          Create a place: User has to enter all the place details to create a place which will be used in checkins to show that user has checked in to this place
          
          Query a place: Displays list of all places which are created till now and then on choosing a particular place you can then update the place that is being created
          
          Search a place: Enter the place name and tap on search which will display the information of created place
  
10. "Push Notifications"

        Push subscription: Enter channel name and the device token to subscribe and get notifications for that particular device

        Push Notify: Inputs has to be given like channel name,payload and user name to send a push notification such that the user having this token will receive a push notification.

        Push Unsubscribe: Channel name has to be provided to unsubscribe the existing channel

     
    
  
