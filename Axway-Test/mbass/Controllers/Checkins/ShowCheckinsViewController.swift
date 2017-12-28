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
    @IBOutlet weak var checkinTxtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showCheckinsApi()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
