//
//  QueryCheckinsViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 27/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class QueryCheckinsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
@IBOutlet weak var querycheckinsTableView: UITableView!
    var checkinsArr:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        queryCheckin()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QueryCheckinCell")
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        
        let checkinDict = self.checkinsArr[indexPath.row] as! NSDictionary
        cell!.textLabel?.text = (checkinDict["message"] as! String)
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let checkinDict = self.checkinsArr[indexPath.row] as! NSDictionary
        let showCheckin = self.storyboard?.instantiateViewController(withIdentifier: "ShowCheckinsViewController") as! ShowCheckinsViewController
        showCheckin.checkinId = checkinDict["id"] as! String
        self.navigationController?.pushViewController(showCheckin, animated: true)
        
    }


    //checkin related apis
    func queryCheckin(){
        
         ACProgressHUD.shared.showHUD()
        CheckinsAPI.checkinsQuery { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else
            {
                if response!["response"] != nil{
                let responseDictionary = response?["response"] as! NSDictionary
                self.checkinsArr = responseDictionary["checkins"] as! NSArray
                self.querycheckinsTableView.reloadData()
                }
                else
                {
                    let value = response?.description
                    Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                }
            }

        }
    }

   
    
}
