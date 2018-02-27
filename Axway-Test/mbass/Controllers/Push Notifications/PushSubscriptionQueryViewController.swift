//
//  PushSubscriptionQueryViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 28/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class PushSubscriptionQueryViewController: UIViewController {

    var isPushQuery:Bool = false
    @IBOutlet weak var queryTxtVw: UITextView!
    
    @IBAction func queryBtnAction(_ sender: Any) {
        
        if isPushQuery
        {
           querySubscriptionApi()
        }
        else
        {
            queryChannelApi()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func querySubscriptionApi()
   {
    ACProgressHUD.shared.showHUD()
    PushNotificationsAPI.pushNotificationsQuery(suId: nil, channel: nil, deviceToken: nil, type: nil
    , page: nil, perPage: nil, limit: nil, skip: nil, prettyJson: nil) { (response, error) in
        
        ACProgressHUD.shared.hideHUD()
        if (error != nil) {
            
            Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            
        }
        else {
            let value = response?.description
            self.queryTxtVw.text = value!
        }
        
    }
   }
    
   func queryChannelApi()
   {
        ACProgressHUD.shared.showHUD()
    PushNotificationsAPI.pushNotificationsChannelsQuery(userId: nil, page: nil, perPage: nil, prettyJson: nil, count: nil) { (response, error) in
        ACProgressHUD.shared.hideHUD()
        if (error != nil) {
            
            Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            
        }
        else {
            let value = response?.description
            self.queryTxtVw.text = value!
        }
        
    }
    
   }

}
