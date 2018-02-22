//
//  QueryListViewController.swift
//  Axway-Test
//
//  Created by Harika Annam on 31/01/18.
//  Copyright © 2018 Innominds. All rights reserved.
//

import UIKit

class QueryListViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var queryTableView: UITableView!
    var usersArray:NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        self.showQueryList()
       
        
    }
    func showQueryList() {
        ACProgressHUD.shared.showHUD()

        UsersAPI.usersQuery(page: nil, perPage: nil, limit: nil, skip: nil, where_: nil, order: nil, sel: nil, showUserLike: nil, unsel: nil, responseJsonDepth: nil, prettyJson: nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                
                let metaDictionary = response?["meta"] as! NSDictionary
                let serverStatus = metaDictionary["status"] as! String
                let failStatus = "fail"
                if (serverStatus.lowercased() == failStatus) {
                    let value = response?.description
                    Utils.showAlertWithOkButton(titleStr:"Fail" , messageStr: value!, viewController: self)
                    
                }
                else {
                    
                    let value = response?["response"] as! NSDictionary
                    self.usersArray = value["users"] as! NSArray
                    self.queryTableView.reloadData()
                    
                }
            }
            
            // usersArray = response!["users"] as! NSArray
        }
    }
    //TableView Controllor methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.usersArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userQueryCell")
        let listDict = self.usersArray[indexPath.row] as! NSDictionary
        cell!.textLabel?.text = listDict["username"] as? String? ?? ""
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userDict = self.usersArray[indexPath.row] as! NSDictionary
        let userDetails = self.storyboard?.instantiateViewController(withIdentifier: "ShowCheckinsViewController") as! ShowCheckinsViewController
        userDetails.userId = userDict["id"] as! String
        userDetails.showQueryUser = true
        self.navigationController?.pushViewController(userDetails, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
