//
//  CreateOrUpdateACLViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/15/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit
enum operationType: Int {
  case Create = 1, Show, Update
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
  @IBOutlet weak var aclnameTextfield: UITextField!
  
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
        aclButton.setTitle("Show ACL", for: UIControlState.normal)
         aclButton.addTarget(self, action:#selector(showACLMethod(_:)), for: UIControlEvents.touchUpInside)
            break;
      case operationType.Update:
        self.title = "Update"
        aclButton.setTitle("Update ACL", for: UIControlState.normal)
         aclButton.addTarget(self, action:#selector(updateACLMethod), for: UIControlEvents.touchUpInside)
            break;
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
        
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
      else {
        
        
        let metaDictionary = response?["meta"] as! NSDictionary

        let serverStatus = metaDictionary["status"] as! String

        let failStatus = "fail"
        if (serverStatus.lowercased() == failStatus) {
          
          let value = response?.description
          
          let alert = UIAlertController(title: "Fail", message:value, preferredStyle: UIAlertControllerStyle.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
          
        }
        else {
          
         // let responseDictionary = response?["response"] as! NSDictionary

          //let readersArray = responseDictionary["readers"]
          //let writerssArray = responseDictionary["writers"]
          
          let value = response?.description
          
          let alert = UIAlertController(title: "Fail", message:value, preferredStyle: UIAlertControllerStyle.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
          self.present(alert, animated: true, completion: nil)

          
        }
        
       
        
      }
      

    }
    
  }
  
  
  
  func showAllusers() {
    
    
    ACProgressHUD.shared.showHUD()
    
    UsersAPI.usersQuery { (response, error) in
      ACProgressHUD.shared.hideHUD()
      
      if (error != nil) {
        
        let alert = UIAlertController(title: "All Users", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
      else {
        
        self.listArray.removeAllObjects()
        
        self.listArray.add(["name":"<<Public Access>>","id":""])

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
        
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
      }
      else {
        
        
        let value = response?.description
        
        let alert = UIAlertController(title: "Create ACL", message:value, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
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
          
          let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
          
        }
        else {
          
          
          let value = response?.description
          
          let alert = UIAlertController(title: "Create ACL", message:value, preferredStyle: UIAlertControllerStyle.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
          
        }

    }
    
  }
  
  @IBAction func doneMethod(_ sender: Any) {
    
    listView.isHidden = true
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
