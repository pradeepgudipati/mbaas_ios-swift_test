//
//  PushSubscriptionViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 28/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class PushSubscriptionViewController: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var deviceTokenTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } 
    @IBAction func subscribeBtnAction(_ sender: Any) {
        if nameTxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: "Please enter channel name", viewController: self)
        }
        else if deviceTokenTxt.text!.characters.count == 0
        {
             Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: "Please enter apns id", viewController: self)
        }
        else
        {
            subscribePushNotification()
        }
    }

    func subscribePushNotification()
    {
        ACProgressHUD.shared.showHUD()
        PushNotificationsAPI.pushNotificationsSubscribe(channel:nameTxt.text! , deviceToken: deviceTokenTxt.text!, type: "ios") { (response,error) in
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

}
