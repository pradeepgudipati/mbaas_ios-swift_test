//
//  ShowCheckinsViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 27/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ShowCheckinsViewController: UIViewController {
    var checkinsArr:NSArray = []
    var checkinId:String = ""
    var userId:String = ""
    var showQueryUser : Bool = false
    @IBOutlet weak var checkinTxtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if showQueryUser {
            self.showQueryApi()
        } else {
            showCheckinsApi()

        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    //show Query api
    
    func showQueryApi()
    {
        ACProgressHUD.shared.showHUD()
        UsersAPI.usersShow(userId: userId, userIds: nil, responseJsonDepth: nil, showUserLike: nil, prettyJson: nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                let value = response?.description
                self.checkinTxtView.text = value
            }
        }
     
    }

   //show checkins api
    
    func showCheckinsApi()
    {
        ACProgressHUD.shared.showHUD()
        CheckinsAPI.checkinsShow(checkinId: checkinId, responseJsonDepth: 3, showUserLike: nil, prettyJson:nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                let value = response?.description
                self.checkinTxtView.text = value
            }
        }
    }

}
