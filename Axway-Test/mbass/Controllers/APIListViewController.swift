//
//  APIListViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/13/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit
enum ListType: Int {
    case UsersList = 1, Cllist, Chatlist, Checkinlist,CustomObject,GeoFencList,PhotoCollection,PlacesList,PushNotify,PhotosList
}

class APIListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var usersListtableView: UITableView!
  @IBOutlet weak var listView: UIView!
  var ListTypeValue:ListType = .UsersList
  var listArray: NSMutableArray = []
  var allUsersListArray: NSArray = []
//  var usersList: Bool = false
//  var cllist:Bool = false
//  var chatlist:Bool = false
//  var checkinlist:Bool = false
//  var customObject:Bool = false
//  var geoFencList : Bool = false
//  var photoCollection : Bool = false
//  var placeslist:Bool = false
//  var pushNotify:Bool = false
//  var photosList:Bool = false
  var chatsArr: NSArray = []

  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.delegate = self
      self.tableView.dataSource = self
      listView.isHidden = true
      self.usersListtableView.tableFooterView = UIView()
        
        if  ListTypeValue.rawValue == ListType.Chatlist.rawValue
        {
            getchatsGroup()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if (tableView == self.usersListtableView) {
       return allUsersListArray.count
    }
    else {
      return listArray.count
    }

  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
    cell!.selectionStyle = UITableViewCellSelectionStyle.none

     if (tableView == self.tableView) {
      cell!.textLabel?.text = listArray[indexPath.row] as? String
    }
     else {
      
      let nameDic:NSDictionary = allUsersListArray[indexPath.row] as! NSDictionary;
      let firstName = nameDic["first_name"] as! String
      let lastName = nameDic["last_name"] as! String
      cell!.textLabel?.text = "\(firstName) \(lastName)"
      
    }
    return cell!
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.tableView.contentInset = UIEdgeInsetsMake(0,0,55,0)
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if ListTypeValue.rawValue == ListType.UsersList.rawValue
    {
    if (tableView == self.usersListtableView) {
      
      return;
    }
    
    switch indexPath.row {
      
      case 0:
        let navCreateUser = self.storyboard?.instantiateViewController(withIdentifier: "CreateUserViewController") as! CreateUserViewController
        navCreateUser.isUpdateUser = false
        self.navigationController?.pushViewController(navCreateUser,animated:true)
       break
      case 1:
        showLoginAlert()
      break
      case 2:
        //checking whether userid is present or not to get user informations
        if UserDefaults.standard.object(forKey: "userId") != nil
        {
            //obtaining stored userid to get user information
            let userDefaults = UserDefaults.standard
            let useridstr  = userDefaults.string(forKey: "userId")
            if ( useridstr?.characters.count != 0)
            {
             showLoginUserInfo(userid:useridstr!)
            }
            else
            {
             Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please login to get user details", viewController: self)
            }
        }
        else
        {
        Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please login to get user details", viewController: self)
        }
       break
     case 3:
        let navCreateUser = self.storyboard?.instantiateViewController(withIdentifier: "CreateUserViewController") as! CreateUserViewController
        navCreateUser.isUpdateUser = true
        self.navigationController?.pushViewController(navCreateUser,animated:true)
        
      break
      case 4:
        showDeleteUserAlert()
      break
      case 5:
      logoutCurrentUser()
      break
      case 6:
        showQueryAlert()
      
    default:
        showLoginAlert()

    }
    }
    else if ListTypeValue.rawValue == ListType.Cllist.rawValue
    {
        switch indexPath.row{
        case 0:
            let aCreateOrUpdateACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateOrUpdateACLViewController") as! CreateOrUpdateACLViewController
            aCreateOrUpdateACLViewController.operationTypeValue = operationType.Create
            self.navigationController?.pushViewController(aCreateOrUpdateACLViewController, animated: true)
            break;
            
        case 1:
            let aCreateOrUpdateACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateOrUpdateACLViewController") as! CreateOrUpdateACLViewController
            aCreateOrUpdateACLViewController.operationTypeValue = operationType.Show
            self.navigationController?.pushViewController(aCreateOrUpdateACLViewController, animated: true)
            break;
    
        case 2:
            let aCreateOrUpdateACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateOrUpdateACLViewController") as! CreateOrUpdateACLViewController
            aCreateOrUpdateACLViewController.operationTypeValue = operationType.Update
            self.navigationController?.pushViewController(aCreateOrUpdateACLViewController, animated: true)

            break;
        case 3:
            let aCreateOrUpdateACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateOrUpdateACLViewController") as! CreateOrUpdateACLViewController
            aCreateOrUpdateACLViewController.operationTypeValue = operationType.checkPermissions
            self.navigationController?.pushViewController(aCreateOrUpdateACLViewController, animated: true)
            break;
            
        default:
            break;
        }
    }
    else if ListTypeValue.rawValue == ListType.Chatlist.rawValue
    {
        if indexPath.row == 0
        {
            let displayChats = self.storyboard?.instantiateViewController(withIdentifier: "DisplayGroupChatsViewController") as! DisplayGroupChatsViewController
            self.navigationController?.pushViewController(displayChats, animated: true)
            
        }
        else if indexPath.row == 1
        {
            let displayUsers = self.storyboard?.instantiateViewController(withIdentifier: "ListOfUsersViewController") as! ListOfUsersViewController
            self.navigationController?.pushViewController(displayUsers, animated: true)
            
            
        }
        else
        {
        let showChatsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowChatsViewController") as! ShowChatsViewController
        
            if self.chatsArr.count > 0
            {
                let participentsDict = self.chatsArr[indexPath.row - 2] as! NSDictionary
                showChatsViewController.chatGroupId = participentsDict["id"] as! String
                let participentsArr = participentsDict["participate_users"] as! NSArray
                if participentsArr.count>0
                {
                    var participentIds:String = ""
                    for respDict in participentsArr
                    {
                        let resDict = respDict as! NSDictionary
                        if participentIds.characters.count == 0
                        {
                            participentIds = resDict["id"] as! String
                        }
                        else
                        {
                            let idStr =  resDict["id"] as! String
                            participentIds +=  "," + idStr
                        }
                    }
                    showChatsViewController.participateIds = participentIds
                }
                self.navigationController?.pushViewController(showChatsViewController, animated: true)
                
            }
       
        }
        
    }
    else if ListTypeValue.rawValue == ListType.Checkinlist.rawValue
    {
        if indexPath.row == 0
        {
            let createCheckin = self.storyboard?.instantiateViewController(withIdentifier: "CreateCheckinsViewController") as! CreateCheckinsViewController
            self.navigationController?.pushViewController(createCheckin, animated: true)
        }
        else
        {
            let queryCheckin = self.storyboard?.instantiateViewController(withIdentifier: "QueryCheckinsViewController") as! QueryCheckinsViewController
            self.navigationController?.pushViewController(queryCheckin, animated: true)
        }
        
    }
    else if ListTypeValue.rawValue == ListType.CustomObject.rawValue
    {
        if indexPath.row == 0
        {
            let createCustomObj = self.storyboard?.instantiateViewController(withIdentifier: "CreateCustomObjViewController") as! CreateCustomObjViewController
            self.navigationController?.pushViewController(createCustomObj, animated: true)
        }
        else
        {
            let createCustomObj = self.storyboard?.instantiateViewController(withIdentifier: "QueryCustomObjViewController") as! QueryCustomObjViewController
            self.navigationController?.pushViewController(createCustomObj, animated: true)
        }
    }
    else if ListTypeValue.rawValue == ListType.GeoFencList.rawValue
    {
        if indexPath.row == 0
        {
            let createGeoFence = self.storyboard?.instantiateViewController(withIdentifier: "CreateGeoFenceViewController") as! CreateGeoFenceViewController
            self.navigationController?.pushViewController(createGeoFence, animated: true)
            
        }
        else
        {
            let queryGeoFence = self.storyboard?.instantiateViewController(withIdentifier: "QueryGeoFencViewController") as! QueryGeoFencViewController
            self.navigationController?.pushViewController(queryGeoFence, animated: true)
            
        }
    }
    else if ListTypeValue.rawValue == ListType.PhotoCollection.rawValue
    {
        if indexPath.row == 0
        {
            let userDefaults = UserDefaults.standard
            userDefaults.set("", forKey: "collectionId")
            userDefaults.set("", forKey: "collectionName")
            
            let createPhotoClctn = self.storyboard?.instantiateViewController(withIdentifier: "CreatePhotoClctnViewController") as! CreatePhotoClctnViewController
            self.navigationController?.pushViewController(createPhotoClctn, animated: true)
            
        }
        else
        {
            let shwPhotoClctn = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotoClctnViewController") as! ShowPhotoClctnViewController
            self.navigationController?.pushViewController(shwPhotoClctn, animated: true)
            
        }
    }
    else if ListTypeValue.rawValue == ListType.PhotosList.rawValue
    {
        switch indexPath.row{
        case 0:
            let aCreatePhotoViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreatePhotoViewController") as! CreatePhotoViewController
            self.navigationController?.pushViewController(aCreatePhotoViewController, animated: true)
            break;
            
        case 1:
            let aQueryPhotoViewController = self.storyboard?.instantiateViewController(withIdentifier: "QueryPhotoViewController") as! QueryPhotoViewController
            self.navigationController?.pushViewController(aQueryPhotoViewController, animated: true)
            break;
            
            
        default:
            break;
        }
    }
    else if ListTypeValue.rawValue == ListType.PlacesList.rawValue
    {
        switch indexPath.row{
        case 0:
            let aCreatePlaceViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreatePlaceViewController") as! CreatePlaceViewController
            aCreatePlaceViewController.operationTypeValue = updationType.Create
            self.navigationController?.pushViewController(aCreatePlaceViewController, animated: true)
            break;
            
        case 1:
            let listOfPlacesPACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "QueryPlaceViewController") as! QueryPlaceViewController
            self.navigationController?.pushViewController(listOfPlacesPACLViewController, animated: true)
            break;
            
        case 2:
            let aSearchACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchPlaceViewController") as! SearchPlaceViewController
            self.navigationController?.pushViewController(aSearchACLViewController, animated: true)
            break;
            
        default:
            break;
        }
    }
    else if ListTypeValue.rawValue == ListType.PushNotify.rawValue
    {
        switch indexPath.row{
        case 0:
            let aPushSubscription = self.storyboard?.instantiateViewController(withIdentifier: "PushSubscriptionViewController") as! PushSubscriptionViewController
            self.navigationController?.pushViewController(aPushSubscription, animated: true)
            break;
            
        case 1:
            let aPushNotify = self.storyboard?.instantiateViewController(withIdentifier: "PushNotifyViewController") as! PushNotifyViewController
            self.navigationController?.pushViewController(aPushNotify, animated: true)
            break;
            
        case 2:
            let aPushUnsubscribe = self.storyboard?.instantiateViewController(withIdentifier: "PushUnsubscribeViewController") as! PushUnsubscribeViewController
            self.navigationController?.pushViewController(aPushUnsubscribe, animated: true)
            break;
        case 3:
            let aPushsubscribeQuery = self.storyboard?.instantiateViewController(withIdentifier: "PushSubscriptionQueryViewController") as! PushSubscriptionQueryViewController
            aPushsubscribeQuery.isPushQuery = true
            
            self.navigationController?.pushViewController(aPushsubscribeQuery, animated: true)
            break;
        case 4:
            let aPushsubscribeQuery = self.storyboard?.instantiateViewController(withIdentifier: "PushSubscriptionQueryViewController") as! PushSubscriptionQueryViewController
            aPushsubscribeQuery.isPushQuery = false
            self.navigationController?.pushViewController(aPushsubscribeQuery, animated: true)
            break;
        default:
            break;
        }
        
    }
  }
  
/*
      This method is used for login user. Params username, password
 */
  func loginMethod(username:String,password:String) {
    

    ACProgressHUD.shared.showHUD()

    UsersAPI.usersLoginUser(login: username, password: password) { (response, error) in
      
      ACProgressHUD.shared.hideHUD()

      if (error != nil) {
        
        Utils.showAlertWithOkButton(titleStr:"Login Error" , messageStr: (error?.localizedDescription)!, viewController: self)
      }
      else {
        
        if let val = response?["response"]{
            print(val)
        let value = response?.description
        let responseDictionary = response?["response"] as! NSDictionary
        let responseArr = responseDictionary["users"] as! NSArray
        let dict = responseArr[0] as! NSDictionary
        
        //store userid into userdefaults for further usage
        let userDefaults = UserDefaults.standard
        userDefaults.set(dict["id"], forKey: "userId")
        Utils.showAlertWithOkButton(titleStr:"Login Success" , messageStr:value! , viewController: self)

        }
        else
        {
        Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: (error?.localizedDescription)!, viewController: self)
            
        }
        
      }
    
    }

  }
  
 //This method is used for displaying login alert to enter username and password
  func showLoginAlert() {
    
    let alertController = UIAlertController(title: "Login", message: "Please enter login details or Login as default", preferredStyle: UIAlertControllerStyle.alert)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
        (action : UIAlertAction!) -> Void in
        
    })
    
    let saveAction = UIAlertAction(title: "Login", style: UIAlertActionStyle.default, handler: {
      alert -> Void in
      
      //let keyTextField = alertController.textFields![0] as UITextField
      //let valueTextField = alertController.textFields![1] as UITextField
      
      //Login with dynamic details
//        if (keyTextField.text?.isEmpty)!
//        {
//           Utils.showAlertWithOkButton(titleStr:"Alert", messageStr: "Please enter username", viewController: self)
//        }
//        else if (valueTextField.text?.isEmpty)!
//        {
//          Utils.showAlertWithOkButton(titleStr:"Alert", messageStr: "Please enter password", viewController: self)
//        }
//        else
//        {
      //self.loginMethod(username: keyTextField.text!, password: valueTextField.text!)
       // }
        
        self.loginMethod(username: "bahubhali", password: "password")
        
      
    })
    
    alertController.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Username"
    }
    alertController.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Password"
      textField.isSecureTextEntry = true
    }
    
    alertController.addAction(cancelAction)
    alertController.addAction(saveAction)

    self.present(alertController, animated: true, completion: nil)
  }
    
    
    //This method is used for obtaining the information of user by passing loggedin userid
    func showLoginUserInfo(userid:String){
        ACProgressHUD.shared.showHUD()

        UsersAPI.usersShow(userId: userid, userIds: nil, responseJsonDepth: nil, showUserLike: nil, prettyJson: nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                return;
                
            }
            else
            {
                let value = response?.description
                
                Utils.showAlertWithOkButton(titleStr:"Success" , messageStr: value!, viewController: self)
            }
            
        }
    }

    // deleting user
    func deleteUser(emailStr: String) {
    
        do{
    ACProgressHUD.shared.showHUD()

        let fieldDict:[String:String] = ["Email":emailStr] //"{\"Email\":" + emailStr + "}"
        
        let data = try JSONSerialization.data(withJSONObject: fieldDict, options: .init(rawValue: 0)) as Data
        
        let fieldStr = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
            UsersAPI.usersBatchDelete(where_: (fieldStr! as String)) { (response, error) in
      
      ACProgressHUD.shared.hideHUD()

      if (error != nil) {
        
        Utils.showAlertWithOkButton(titleStr:"Delete Error" , messageStr: (error?.localizedDescription)!, viewController: self)
        
      }
      else {
        
        let value = response?.description
        Utils.showAlertWithOkButton(titleStr:"Deleted User Successfully" , messageStr: value!, viewController: self)
      }

      
      
    }
        }
        catch _{
            print("error")
        }
    
    
  }
    
    //This method is used for displaying delete user alert to enter username
    func showDeleteUserAlert() {
        
        let alertController = UIAlertController(title: "Enter EmailId", message: "Please enter the emailId that you want delete", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        let saveAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.default, handler: {
            alert -> Void in
            
            let keyTextField = alertController.textFields![0] as UITextField
            
            //Login with dynamic details
            if (keyTextField.text?.isEmpty)!
            {
                Utils.showAlertWithOkButton(titleStr:"Alert", messageStr: "Please enter EmailId", viewController: self)
            }
            else
            {
                self.deleteUser(emailStr:keyTextField.text!)
            }
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "EmailId"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
  
  //delete user by query
  func deleteUserByQuery(key:String,value:String) {
    
    ACProgressHUD.shared.showHUD()

    UsersAPI.usersBatchDelete(where_: NSString(format: "{\"%@\":\"%@\"}", key, value) as String) { (response, error) in
      
      ACProgressHUD.shared.hideHUD()

      if (error != nil) {
        
        Utils.showAlertWithOkButton(titleStr:"Delete Error" , messageStr: (error?.localizedDescription)!, viewController: self)
        
      }
      else {
        
        let value = response?.description
        Utils.showAlertWithOkButton(titleStr:"Deleted User Successfully" , messageStr: value!, viewController: self)
        
      }
    }
  }
   
    //logout current user
    func logoutCurrentUser(){
     
        ACProgressHUD.shared.showHUD()
        
        UsersAPI.usersLogoutUser { (response, error) in
            
            
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                 Utils.showAlertWithOkButton(titleStr:"Logout Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else {
                
                
                let value = response?.description
                
                let alert = UIAlertController(title: "User logged out Successfully", message:value, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alert -> Void in
                    
                    let userDefaults = UserDefaults.standard
                    userDefaults.set("", forKey: "userId")
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        }
        
        
    }
  
  func showQueryAlert() {
    
    let alertController = UIAlertController(title: "Query", message: "Please enter query", preferredStyle: UIAlertControllerStyle.alert)
    
    let saveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler: {
      alert -> Void in
      
      let keyTextField = alertController.textFields![0] as UITextField
      let valueTextField = alertController.textFields![1] as UITextField
      
       self.deleteUserByQuery(key: keyTextField.text!, value: valueTextField.text!)
      
    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
      (action : UIAlertAction!) -> Void in
      
    })
    
    alertController.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Enter key"
    }
    alertController.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Enter value"
    }
    
    alertController.addAction(cancelAction)
    alertController.addAction(saveAction)
    
    self.present(alertController, animated: true, completion: nil)
  }
    
    
  
  func showAllUsers() {
   ACProgressHUD.shared.showHUD()
    UsersAPI.usersQuery { (response, error) in
      ACProgressHUD.shared.hideHUD()
      
      if (error != nil) {
        
         Utils.showAlertWithOkButton(titleStr:"All Users" , messageStr: (error?.localizedDescription)!, viewController: self)
      }
      else {
        let responseDictionary = response?["response"] as! NSDictionary
        self.allUsersListArray = responseDictionary["users"] as! NSArray
          
          self.view.bringSubview(toFront: self.listView)
          self.listView.isHidden = false
          self.usersListtableView.reloadData()
        
      }
    }
    
  }
    
    func getchatsGroup()
    {
        ACProgressHUD.shared.showHUD()
        
        ChatsAPI.chatsGetChatGroups(page: nil , perPage: nil , where_: nil , order: nil , responseJsonDepth: 3 , prettyJson: nil){(response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"All Users" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else{
                _ = response?.description
                if response!["response"] != nil{
                    let responsDict = response?["response"] as! NSDictionary
                    self.chatsArr = responsDict["chat_groups"] as! NSArray

                    for partcpntsDict in self.chatsArr
                    {
                    let participentsDict = partcpntsDict as! NSDictionary
                    let participentsArr = participentsDict["participate_users"] as! NSArray
                    if participentsArr.count>0
                    {
                        var nameStr:String = ""
                        for respDict in participentsArr
                        {
                            let resDict = respDict as! NSDictionary
                            if nameStr.characters.count == 0
                            {
                                 nameStr = resDict["first_name"] as! String
                            }
                            else
                            {
                                let firstNameStr =  resDict["first_name"] as! String
                                nameStr +=  "," + firstNameStr
                            }
                        }
                        self.listArray.add(nameStr)
                        self.tableView.reloadData()
                    }
                    }
                }
                
            }
        }
    }
    
  @IBAction func doneMethod(_ sender: Any) {
    
    listView.isHidden = true
  }

}
