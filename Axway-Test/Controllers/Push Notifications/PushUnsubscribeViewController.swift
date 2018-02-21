//
//  PushUnsubscribeViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 28/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class PushUnsubscribeViewController: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unsubscribeBtnAction(_ sender: Any) {
        
        unsubscribePushNotification()
        
    }
    func unsubscribePushNotification()
    {
        var deviceToken:String = ""
        if UserDefaults.standard.object(forKey: "DeviceToken") != nil
        {
             let userDefaults = UserDefaults.standard
             deviceToken = userDefaults.string(forKey: "collectionId")!
            
        }
        ACProgressHUD.shared.showHUD()
        PushNotificationsAPI.pushNotificationsUnsubscribeToken(channel: nameTxt.text, deviceToken: deviceToken, prettyJson: nil) { (response, error) in
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
