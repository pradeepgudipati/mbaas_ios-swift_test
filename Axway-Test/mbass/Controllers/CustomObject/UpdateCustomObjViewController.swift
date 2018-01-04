//
//  UpdateCustomObjViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 21/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class UpdateCustomObjViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var updateTableView: UITableView!
   var customObjDict:NSDictionary = [:]
    var className : String = ""
    var fieldDict: NSMutableDictionary = [:]
    var listArr:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func removeBtnAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "", message: "Update values", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in
            alertController.dismiss(animated: true, completion:nil)
        })
        let removeAction = UIAlertAction(title: "Remove", style: UIAlertActionStyle.default, handler: {
            alert -> Void in
            
            self.removeObj()
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(removeAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func removeObj(){
        
        ACProgressHUD.shared.showHUD()
        let idstr = customObjDict["id"] as! String
        CustomObjectsAPI.customObjectsDelete(classname: className, iD: "" , ids: idstr, prettyJson: nil, suId: nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                  if response!["response"] != nil{
                let value = response?.description
                
                let alert = UIAlertController(title: "Removed Successfully", message:value, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alert -> Void in
                    
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let value = response?.description
                    Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                }
            }
        }
        
    }
    
    func updateCustomObj(){
        do{
            

        let data = try JSONSerialization.data(withJSONObject: fieldDict, options: .init(rawValue: 0)) as Data
        let fieldStr = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            ACProgressHUD.shared.showHUD()
            
            CustomObjectsAPI.customObjectsUpdate(classname: className, iD: customObjDict["id"] as! String, fields:fieldStr! as String, tags:nil , photo: nil , photoId: nil , aclName:  nil , aclId: nil , suId: nil , prettyJson: nil) { (response, error) in
            
                ACProgressHUD.shared.hideHUD()

                if (error != nil) {
                    
                    Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                    
                }
                else {
                    let value = response?.description
                     Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                }
                
        }
        }
        catch _{
            print("error")
        }
    }
    
    //UITableview Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return listArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpdateCell", for: indexPath)
        let keyStr = listArr[indexPath.row] as! String;
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text =  keyStr + "\n"  + (customObjDict[keyStr] as! String) 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let keyStr = listArr[indexPath.row] as! String;
        showAlert(keyStr: keyStr)
    }
    
    func showAlert(keyStr: String){
        let alertController = UIAlertController(title: "", message: "Update values", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        let saveAction = UIAlertAction(title: "Update", style: UIAlertActionStyle.default, handler: {
            alert -> Void in
            
            let keyTextField = alertController.textFields![0] as UITextField
            let valueTextField = alertController.textFields![1] as UITextField
            
            if keyTextField.text!.characters.count == 0
            {
                Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter key", viewController: self)
            }
            else if valueTextField.text!.characters.count == 0
            {
                Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter value", viewController: self)
            }
            else
            {
                self.fieldDict = [keyTextField.text! : valueTextField.text!]
                self.updateCustomObj()
            }
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.text = keyStr
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.text = (self.customObjDict[keyStr] as! String)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
  
}
