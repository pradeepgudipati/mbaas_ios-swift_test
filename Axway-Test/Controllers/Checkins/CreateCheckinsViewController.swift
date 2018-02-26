//
//  CreateCheckinsViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 27/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class CreateCheckinsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 @IBOutlet weak var checkinsTableView: UITableView!
      var checkinsArr:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesCheckinApi()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.checkinsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateCheckinCell")
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        
        let checkinDict = self.checkinsArr[indexPath.row] as! NSDictionary
        cell!.textLabel?.text = (checkinDict["name"] as! String)
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let checkinDict = self.checkinsArr[indexPath.row] as! NSDictionary
        self.createCheckinApi(placeid: checkinDict["id"] as! String, placename: checkinDict["name"] as! String)
    }
   
    //Checkin related Apis
    
    func placesCheckinApi(){
        ACProgressHUD.shared.showHUD()
        PlacesAPI.placesQuery { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else
            {
                let responseDictionary = response?["response"] as! NSDictionary
                self.checkinsArr = responseDictionary["places"] as! NSArray
                self.checkinsTableView.reloadData()
                
            }
        }
    }

    func createCheckinApi(placeid:String, placename:String){
        
        ACProgressHUD.shared.showHUD()
        CheckinsAPI.checkinsCreate(placeId: placeid, eventId: nil, message: "Checked in to " + placename , photo: nil, photoId: nil, prettyJson: nil, responseJsonDepth: nil, tags: nil, customFields: nil, aclName: nil, aclId: nil, suId: nil) { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else
            {
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
            }
        }
        
    }
}
