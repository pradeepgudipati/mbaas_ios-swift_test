//
//  APIListViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/13/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class APIListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var usersListtableView: UITableView!
  @IBOutlet weak var listView: UIView!
  var listArray: NSMutableArray = []
  var allUsersListArray: NSArray = []
  var usersList: Bool = false
    var cllist:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.delegate = self
      self.tableView.dataSource = self
      listView.isHidden = true
      self.usersListtableView.tableFooterView = UIView()
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
    
    if usersList
    {
    if (tableView == self.usersListtableView) {
      
      return;
    }
    
    switch indexPath.row {
      
      case 0:
        let navCreateUser = self.storyboard?.instantiateViewController(withIdentifier: "CreateUserViewController") as! CreateUserViewController
        self.navigationController?.pushViewController(navCreateUser,animated:true)
       break
      case 1:
        showLoginAlert()
      break
      case 2:
      //createMultipleUsers()
      break
     case 3:
      //deleteUser()
      break
      case 4:
        deleteUser()
      //showQueryAlert()
      break
      case 5:
      //showAllUsers()
      break
      case 6:
        showQueryAlert()
      
    default:
        showLoginAlert()

    }
    }
    else if cllist
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
            
        default:
            break;
        }
    }
    else
    {
        
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
        
        let alert = UIAlertController(title: "Login Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
      else {
        
        
        let value = response?.description
        
        let alert = UIAlertController(title: "Login Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
    
    }

  }
  
  func showLoginAlert() {
    
    let alertController = UIAlertController(title: "Login", message: "Please enter login details or Login as default", preferredStyle: UIAlertControllerStyle.alert)
    
    let saveAction = UIAlertAction(title: "Login", style: UIAlertActionStyle.default, handler: {
      alert -> Void in
      
      let keyTextField = alertController.textFields![0] as UITextField
      let valueTextField = alertController.textFields![1] as UITextField
      
      //Login with dynamic details
      self.loginMethod(username: keyTextField.text!, password: valueTextField.text!)
      
    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
      (action : UIAlertAction!) -> Void in
      
    })
    let defaultAction = UIAlertAction(title: "Default", style: UIAlertActionStyle.destructive, handler: {
      (action : UIAlertAction!) -> Void in
      
      //Login with static details
      self.loginMethod(username: "bahubhali", password: "password")

    })
    
    alertController.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Username"
    }
    alertController.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Password"
    }
    
    alertController.addAction(saveAction)
    alertController.addAction(cancelAction)
    alertController.addAction(defaultAction)

    self.present(alertController, animated: true, completion: nil)
  }

  
//  func createUser() {
//
//    ACProgressHUD.shared.showHUD()
//
//    //let profileURL : NSURL = NSURL(string: "http://placehold.it/120x120&text=image2")!
//    UsersAPI.usersCreate(email: "bhalla@yopmail.com", username: "Bhalla", password: "password", passwordConfirmation: "password", firstName: "bhalla", lastName: "Deva",  tags:nil, customFields: "", aclName: "", aclId: "", suId: nil, role: "", template: "", confirmationTemplate: "", prettyJson: true) { (response, error) in
//
//      ACProgressHUD.shared.hideHUD()
//
//      if (error != nil) {
//
//        let alert = UIAlertController(title: "Create Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//
//      }
//      else {
//
//
//        let value = response?.description
//
//        let alert = UIAlertController(title: "Create User Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//
//      }
//
//
//    }
//
//  }
    
//    func createUserAlertView(){
//        
//        let alertController = UIAlertController(title: "Create User", message: "Please enter login details or Login as default", preferredStyle: UIAlertControllerStyle.alert)
//        
//        let saveAction = UIAlertAction(title: "Login", style: UIAlertActionStyle.default, handler: {
//            alert -> Void in
//            
//            let keyTextField = alertController.textFields![0] as UITextField
//            let valueTextField = alertController.textFields![1] as UITextField
//            
//            //Login with dynamic details
//            self.loginMethod(username: keyTextField.text!, password: valueTextField.text!)
//            
//        })
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
//            (action : UIAlertAction!) -> Void in
//            
//        })
//        let defaultAction = UIAlertAction(title: "Default", style: UIAlertActionStyle.destructive, handler: {
//            (action : UIAlertAction!) -> Void in
//            
//        })
//        
//        alertController.addTextField { (textField : UITextField!) -> Void in
//            textField.placeholder = "FirstName"
//        }
//        alertController.addTextField { (textField : UITextField!) -> Void in
//            textField.placeholder = "LastName"
//        }
//        alertController.addTextField { (textField : UITextField!) -> Void in
//            textField.placeholder = "UserName"
//        }
//        alertController.addTextField { (textField : UITextField!) -> Void in
//            textField.placeholder = "EmailId"
//        }
//        alertController.addTextField { (textField : UITextField!) -> Void in
//            textField.placeholder = "Password"
//        }
//        alertController.addTextField { (textField : UITextField!) -> Void in
//            textField.placeholder = "Cofirm Password"
//        }
//        
//        alertController.addAction(saveAction)
//        alertController.addAction(cancelAction)
//        alertController.addAction(defaultAction)
//        
//        self.present(alertController, animated: true, completion: nil)
//        
//    }
//  
  func createMultipleUsers() {
    
    ACProgressHUD.shared.showHUD()
    
    var count = 0
    
    let usersArray = [["name": "Bijjaladeva", "password": "password"],["name": "Bhadra", "id": "password"],["name": "Marthanda", "id": "password"],["name": "Sivagami", "id": "password"]]
    
    userLoop: for index in 0...usersArray.count-1 {
      
      
      let userDictionary = usersArray[index]
      
      let name = userDictionary["name"]
      
      UsersAPI.usersCreate(email: name!+"@yopmail.com", username: name, password: "password", passwordConfirmation: "password", firstName: name, lastName: "CG",  tags:nil, customFields: "", aclName: "", aclId: "", suId: nil, role: "", template: "", confirmationTemplate: "", prettyJson: true) { (response, error) in
        
        ACProgressHUD.shared.hideHUD()
        
        count += 1;
        
        if (error != nil) {
          
          let alert = UIAlertController(title: "Login Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
          
          return;
          
        }
        else {
          
          if count == 4 {
            
            let alert = UIAlertController(title: "Success", message:"Multiple users created successfully", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
          }
         
          
        }
        
      }
      
    }
    
  
    
    
    
  }
  
  func deleteUser() {
    
    ACProgressHUD.shared.showHUD()

    UsersAPI.usersBatchDelete(where_: "{\"Email\":\"bhalla@yopmail.com\"}") { (response, error) in
      
      ACProgressHUD.shared.hideHUD()

      if (error != nil) {
        
        let alert = UIAlertController(title: "Delete Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
      else {
        
        
        let value = response?.description
        
        let alert = UIAlertController(title: "Delete User Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }

      
      
    }
    
    
  }
  
  
  func deleteUserByQuery(key:String,value:String) {
    
    ACProgressHUD.shared.showHUD()

    UsersAPI.usersBatchDelete(where_: NSString(format: "{\"%@\":\"%@\"}", key, value) as String) { (response, error) in
      
      ACProgressHUD.shared.hideHUD()

      if (error != nil) {
        
        let alert = UIAlertController(title: "Delete Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
      else {
        
        
        let value = response?.description
        
        let alert = UIAlertController(title: "Delete User Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
      
      
      
    }
    
    
  }
  
  func showQueryAlert() {
    
    let alertController = UIAlertController(title: "Query", message: "Please enter query", preferredStyle: UIAlertControllerStyle.alert)
    
    let saveAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: {
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
    
    alertController.addAction(saveAction)
    alertController.addAction(cancelAction)
    
    self.present(alertController, animated: true, completion: nil)
  }
  
  func showAllUsers() {
    
    
    
    ACProgressHUD.shared.showHUD()

    UsersAPI.usersQuery { (response, error) in
      ACProgressHUD.shared.hideHUD()
      
      if (error != nil) {
        
        let alert = UIAlertController(title: "All Users", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
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

  @IBAction func doneMethod(_ sender: Any) {
    
    listView.isHidden = true
  }

}
