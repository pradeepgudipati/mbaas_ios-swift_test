//
//  PushNotifyViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 28/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class PushNotifyViewController: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var payLoadTxt: UITextField!
    var allUseridsStr:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func susbscribeBtnAction(_ sender: Any) {
        
        if nameTxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: "Please enter channel name", viewController: self)
        }
        else  if payLoadTxt.text!.characters.count == 0
        {
             Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: "Please enter payload", viewController: self)
        }
        else  if usernameTxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: "Please enter usernames", viewController: self)
        }
        else
        {
            usersQueryApi()
        }
        
    }
    func usersQueryApi()
   {
    ACProgressHUD.shared.showHUD()
    UsersAPI.usersQuery { (response, error) in
        ACProgressHUD.shared.hideHUD()
        
        if (error != nil) {
            
            Utils.showAlertWithOkButton(titleStr:"All Users" , messageStr: (error?.localizedDescription)!, viewController: self)
        }
        else {
            let responseDictionary = response?["response"] as! NSDictionary
            let usersArr = responseDictionary["users"] as! NSArray
            
            let arr = self.usernameTxt.text?.components(separatedBy: ",")
            
            for user in usersArr
            {
                let userDict =  user as! NSDictionary
                let usrName = userDict["username"] as! String
                
                for userName in arr!
                {
                    if usrName == userName
                    {
                        if self.allUseridsStr.characters.count == 0
                        {
                            self.allUseridsStr = userDict["id"] as! String
                        }
                        else
                        {
                           let str = userDict["id"] as! String
                           self.allUseridsStr = "," + str
                        }
                    }
                }
                
            }
            
        }
    }
    
    pushNotifyApi()
  }
    
    func pushNotifyApi()
    {
        ACProgressHUD.shared.showHUD()
        PushNotificationsAPI.pushNotificationsNotify(channel: nameTxt.text!, friends: nil, toIds: self.allUseridsStr, payload: payLoadTxt.text!, options: nil, where_: nil, prettyJson: nil) { (response, error) in
            
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
            }
            
        }
        
    }

}
