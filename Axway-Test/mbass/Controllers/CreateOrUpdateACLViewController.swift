//
//  CreateOrUpdateACLViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/15/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit
enum operationType: Int {
  case Create = 1, Show, Update, checkPermissions
}

class CreateOrUpdateACLViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  var isRead : Bool = false
  var isFromShow:Bool = false
  var operationTypeValue:operationType = .Create
  @IBOutlet weak var aclButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var listView: UIView!
  var listArray: NSMutableArray = []
  var selectedReadersListArray: NSMutableArray = []
  var selectedWritersListArray: NSMutableArray = []
  var readersListArray: NSMutableArray = []
  var writersListArray: NSMutableArray = []
  @IBOutlet weak var deleteBtn: UIButton!
  @IBOutlet weak var aclnameTextfield: UITextField!
  @IBOutlet weak var selectedReadersBtn: UIButton!
  @IBOutlet weak var selectWritersBtn: UIButton!
  @IBOutlet weak var createAclBtn: UIButton!
    @IBOutlet weak var checkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.delegate = self
      self.tableView.dataSource = self
      listView.isHidden = true
      self.tableView.allowsMultipleSelection = true
      self.tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
      switch operationTypeValue {
     case operationType.Create:
            self.title = "Create"
            aclButton.setTitle("Create ACL", for: UIControlState.normal)
            aclButton.addTarget(self, action:#selector(createACLMethod(_:)), for: UIControlEvents.touchUpInside)
            break;
      case operationType.Show:
        self.title = "Show"
        deleteBtn.isHidden=false
        deleteBtn.setTitle("Delete ACL", for: UIControlState.normal)
        aclButton.setTitle("Show ACL", for: UIControlState.normal)
         aclButton.addTarget(self, action:#selector(showACLMethod(_:)), for: UIControlEvents.touchUpInside)
            break;
      case operationType.Update:
        self.title = "Update"
        deleteBtn.isHidden=false
        deleteBtn.setTitle("Remove User", for: UIControlState.normal)
        aclButton.setTitle("Update ACL", for: UIControlState.normal)
         aclButton.addTarget(self, action:#selector(updateACLMethod), for: UIControlEvents.touchUpInside)
            break;
      case operationType.checkPermissions:
         self.title = "Check Permissions"
         self.selectedReadersBtn.isHidden = true
         self.selectWritersBtn.isHidden = true
         self.createAclBtn.isHidden = true
         self.deleteBtn.isHidden = true
         self.checkBtn.isHidden = false
        }
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func showACLMethod(_ sender: Any) {
    
    if aclnameTextfield.text?.characters.count==0 {
      return
    }
    
    self.callALCSShowService(aclName: aclnameTextfield.text!)
    
  }
  func callALCSShowService(aclName:String) {
    
    ACProgressHUD.shared.showHUD()

    ACLsAPI.aCLsShow(iD:nil, name: aclName, prettyJson: true) { (response, error) in
      
      ACProgressHUD.shared.hideHUD()
      
      if (error != nil) {
        
        Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
        
      }
      else {
        
        if response!["response"] != nil{
        let metaDictionary = response?["meta"] as! NSDictionary

        let serverStatus = metaDictionary["status"] as! String

        let failStatus = "fail"
        if (serverStatus.lowercased() == failStatus) {
          
        let value = response?.description
          
        Utils.showAlertWithOkButton(titleStr:"Fail" , messageStr: value!, viewController: self)
            
        }
        else {
          
          let value = response?.description
          Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr:value!, viewController: self)
          
        }
      }
      else
        {
            let value = response?.description
            Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr:value!, viewController: self)
            
     }
    }
        
    }
    
  }
  
  
  
  func showAllusers() {
    
    
    ACProgressHUD.shared.showHUD()
    
    UsersAPI.usersQuery { (response, error) in
      ACProgressHUD.shared.hideHUD()
      
      if (error != nil) {
        
        Utils.showAlertWithOkButton(titleStr:"All Users" , messageStr: (error?.localizedDescription)!, viewController: self)
      }
      else {
        
        self.listArray.removeAllObjects()
        
        self.listArray.add(["name":"<<Public Access>>","id":""])

        if response!["response"] != nil{
        let responseDictionary = response?["response"] as! NSDictionary
        
        let allUsersListArray = responseDictionary["users"] as! NSArray
        
        
        for userDictionaryitem in allUsersListArray {
          
          let userDictionary = userDictionaryitem as! NSDictionary
          let firstName = userDictionary["first_name"] as! String
          let lastName = userDictionary["last_name"] as! String
          let fullname = "\(firstName) \(lastName)"
          let userId = userDictionary["id"] as! String
          
          self.listArray.add(["name":fullname, "id": userId])

        }
        
        
        self.view.bringSubview(toFront: self.listView)
        self.listView.isHidden = false
        self.tableView.reloadData()

        if (self.isRead) {
         
          
          for index in self.selectedReadersListArray {
            
            let  indexPath = IndexPath(row: index as Any as! Int, section: 0)
            self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
            
          }
        }
        else {
          for index in self.selectedWritersListArray {
            
            let  indexPath = IndexPath(row: index as Any as! Int, section: 0)
            self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
            
          }
        }
        
      }
      else
      {
        Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: (error?.localizedDescription)!, viewController: self)
      }
     }
    }
  }
  
  func prepareReadersListArray(aclsDetailDictionary:(String,String)) {
    
    
    
    
    
  }
  
  func prepareWritersListArray() {
    
    
  }
  
  @IBAction func selectReadersMethod(_ sender: Any) {
    
       isRead = true
    
    self.showAllusers()

    
   
  }

  @IBAction func selectWritersMethod(_ sender: Any) {
    
    isRead = false
    
    self.showAllusers()

  }
  
  @IBAction func updateACLMethod() {
    
    
    if aclnameTextfield.text?.characters.count==0 {
      return
    }
    
    //Get all readerids
    for index in selectedReadersListArray {
      
      if index as! Int == 0 {
        continue
      }
      let nameDic:NSDictionary = listArray[index as! Int] as! NSDictionary;
      
      let userId = nameDic["id"] as! NSString
      
      readersListArray.add(userId)
    }
    
    for index in selectedWritersListArray {
      
      if index as! Int == 0 {
        continue
      }
      
      let nameDic:NSDictionary = listArray[index as! Int] as! NSDictionary;
      
      let userId = nameDic["id"] as! NSString
      
      writersListArray.add(userId)
    }
    
    let readerIDs = readersListArray.componentsJoined(by: ",")
    let writerIDs = writersListArray.componentsJoined(by: ",")
    
    
    ACProgressHUD.shared.showHUD()
    
    ACLsAPI.aCLsUpdate(name:aclnameTextfield.text!, prettyJson: true, readerIds: readerIDs, writerIds:writerIDs, publicRead: "", publicWrite: "", suId: "") { (response, error) in
      
      ACProgressHUD.shared.hideHUD()
      
      if (error != nil) {
        
        Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
        
      }
      else {
        
        
        let value = response?.description
    
       Utils.showAlertWithOkButton(titleStr:"Create ACL" , messageStr: value!, viewController: self)
        
      }
      
    }
    
  }

  
  
  @IBAction func createACLMethod(_ sender: Any) {
    
    
    if aclnameTextfield.text?.characters.count==0 {
      return
    }
    
  //Get all readerids
    for index in selectedReadersListArray {
      
      if index as! Int == 0 {
        continue
      }
      let nameDic:NSDictionary = listArray[index as! Int] as! NSDictionary;

      let userId = nameDic["id"] as! NSString
      
        readersListArray.add(userId)
    }
    
    for index in selectedWritersListArray {
      
      if index as! Int == 0 {
        continue
      }
      
      let nameDic:NSDictionary = listArray[index as! Int] as! NSDictionary;
      
      let userId = nameDic["id"] as! NSString
      
      writersListArray.add(userId)
    }
    
    let readerIDs = readersListArray.componentsJoined(by: ",")
    let writerIDs = writersListArray.componentsJoined(by: ",")

    
      ACProgressHUD.shared.showHUD()

       ACLsAPI.aCLsCreate(name:aclnameTextfield.text!, readerIds: readerIDs, writerIds:writerIDs, prettyJson: true, publicRead: "", publicWrite: "", suId: "") { (response, error) in
        
        ACProgressHUD.shared.hideHUD()
        
        if (error != nil) {
          
            Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            
        }
        else {
          
          
          let value = response?.description
        Utils.showAlertWithOkButton(titleStr: "Create ACL", messageStr: value! , viewController: self)
          
        }

    }
    
  }
  
    @IBAction func checkBtnAction(_ sender: Any) {
        
        if aclnameTextfield.text!.characters.count > 0
        {
            if UserDefaults.standard.object(forKey: "userId") != nil
            {
                //obtaining stored userid to get user information
                let userDefaults = UserDefaults.standard
                let useridstr  = userDefaults.string(forKey: "userId")
                if ( useridstr?.characters.count != 0)
                {
                    checkUserPermissions(userIdStr: useridstr!)
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
        }
    }
    
    func checkUserPermissions(userIdStr:String){
        
        ACProgressHUD.shared.showHUD()
        ACLsAPI.aCLsCheck(name: aclnameTextfield.text, iD: nil, prettyJson: nil, userId: userIdStr) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
           
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                let value = response?.description

                Utils.showAlertWithOkButton(titleStr:"Check Permissions" , messageStr: value!, viewController: self)
                
            }
        }
    
    }
    
    @IBAction func doneMethod(_ sender: Any) {
    
    listView.isHidden = true
  }
  
    @IBAction func deleteBtnAction(_ sender: Any) {
        if aclnameTextfield.text!.characters.count > 0
        {
        if deleteBtn.titleLabel?.text == "Remove User"
        {
            //Get all readerids
            for index in selectedReadersListArray {
                
                if index as! Int == 0 {
                    continue
                }
                let nameDic:NSDictionary = listArray[index as! Int] as! NSDictionary;
                
                let userId = nameDic["id"] as! NSString
                
                readersListArray.add(userId)
            }
            
            for index in selectedWritersListArray {
                
                if index as! Int == 0 {
                    continue
                }
                
                let nameDic:NSDictionary = listArray[index as! Int] as! NSDictionary;
                
                let userId = nameDic["id"] as! NSString
                
                writersListArray.add(userId)
            }
   
            ACProgressHUD.shared.showHUD()
                
            
            let readerIDs = readersListArray.componentsJoined(by: ",")
            let writerIDs = writersListArray.componentsJoined(by: ",")
  
            
            ACLsAPI.aCLsRemove(name:aclnameTextfield.text , iD:nil , prettyJson: nil, readerIds: readerIDs, writerIds: writerIDs, completion: { (response, error) in
                
                ACProgressHUD.shared.hideHUD()
                
                if (error != nil) {
                    Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                }
                else {
                    let value = response?.description
                    Utils.showAlertWithOkButton(titleStr:"Remove User" , messageStr: value!, viewController: self)
                   
                }
                
            })
          
        }
        else
        {
            ACProgressHUD.shared.showHUD()
    ACLsAPI.aCLsDelete(iD: nil, name: aclnameTextfield.text, prettyJson: nil
        , suId: nil
        , completion: { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                
                 Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Delete ACL" , messageStr: value!, viewController: self)
            }
            
            })
      
      }
    }
    else
    {
    Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter ACL name to delete", viewController: self)
    }
    }
    func displayAllUSers() {
    
     

  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return listArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let nameDic:NSDictionary = listArray[indexPath.row] as! NSDictionary;
    cell.textLabel?.text = nameDic["name"] as? String
    cell.selectionStyle = UITableViewCellSelectionStyle.none
    cell.accessoryType = cell.isSelected ? .checkmark : .none
    if isRead {
      if (selectedReadersListArray.contains(indexPath.row)) {
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
      }
      else {
      tableView.cellForRow(at: indexPath)?.accessoryType = .none
      }
    }
    else {
      
      if (selectedWritersListArray.contains(indexPath.row)) {
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
      }
      else {
         tableView.cellForRow(at: indexPath)?.accessoryType = .none
      }
      
    }
    return cell
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.tableView.contentInset = UIEdgeInsetsMake(0,0,55,0)
  }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

    if isRead {
      
      if (selectedReadersListArray.contains(indexPath.row)) {
        
           selectedReadersListArray.remove(indexPath.row)
      }
      else {
        
          selectedReadersListArray.add(indexPath.row)
      }
      
    }
    else {
      
      if (selectedWritersListArray.contains(indexPath.row)) {
        
        selectedWritersListArray.remove(indexPath.row)
      }
      else {
        
        selectedWritersListArray.add(indexPath.row)
      }
      
    }
    
  }
  
   func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.accessoryType = .none
    if isRead {
      
      if (selectedReadersListArray.contains(indexPath.row)) {
        
        selectedReadersListArray.remove(indexPath.row)
      }
      
    }
    else {
      
      if (selectedWritersListArray.contains(indexPath.row)) {
        
        selectedWritersListArray.remove(indexPath.row)
      }
    }
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
    textField.resignFirstResponder()
    return true
  }

}
