//
//  QueryCustomObjViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 21/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class QueryCustomObjViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var queryTableVw: UITableView!
    @IBOutlet weak var classnameTxt: UITextField!
 
    var listArr:NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func queryBtnAction(_ sender: Any) {
        
        if classnameTxt.text!.characters.count > 0
        {
            ACProgressHUD.shared.showHUD()

            CustomObjectsAPI.customObjectsQuery(classname: classnameTxt.text!, completion: { (response, error) in
                ACProgressHUD.shared.hideHUD()

                if (error != nil) {
                    
                    Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                    
                }
                else {
                    
                    
                    //let value = response?.description
                    let responseDictionary = response?["response"] as! NSDictionary
                    self.listArr = responseDictionary[self.classnameTxt.text as Any] as! NSArray
                    print(self.listArr)
                    self.queryTableVw.reloadData()
                    
                }
                
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QueryCell", for: indexPath)
        let listDic:NSDictionary = listArr[indexPath.row] as! NSDictionary;
        cell.textLabel?.text = listDic["id"] as? String 
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let listDic:NSDictionary = listArr[indexPath.row] as! NSDictionary;
        
        let updateCustomObj = self.storyboard?.instantiateViewController(withIdentifier: "UpdateCustomObjViewController") as! UpdateCustomObjViewController
        updateCustomObj.className = classnameTxt.text!
        let objctsArr = listDic.allKeys as NSArray
        let objlistArr:NSMutableArray = []
        for fieldKey in objctsArr
        {
            if !(fieldKey as! String == "id") && !(fieldKey as! String == "updated_at") && !(fieldKey as! String == "created_at") && !(fieldKey as! String == "user_id")
            {
                objlistArr.add(fieldKey)
            }
        }
        updateCustomObj.listArr = objlistArr
        updateCustomObj.customObjDict = listDic
        self.navigationController?.pushViewController(updateCustomObj, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }


    

}
