//
//  ListOfUsersViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 19/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ListOfUsersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var isRead : Bool = false
    var allUsersListArray:NSArray = []
    var selectedUsersListArray: NSMutableArray = []
    var selectedUsersIdsArray: NSMutableArray = []
    
    @IBOutlet weak var listOfUserTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
         self.showAllUsers()
        self.listOfUserTableView.allowsMultipleSelection = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startChattingBtnAction(_ sender: Any) {
        
        if self.selectedUsersListArray.count > 0
        {
            let showChatsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowChatsViewController") as! ShowChatsViewController
            var participentIds:String = ""
            for userid in self.selectedUsersIdsArray
            {
                let usrId = userid as! String
                if participentIds.characters.count == 0
                {
                    participentIds = usrId
                }
                else
                {
                    participentIds +=  "," + usrId
                }
            }
            showChatsViewController.isFromCreateChat = true
            showChatsViewController.participateIds = participentIds
           self.navigationController?.pushViewController(showChatsViewController, animated: true)
            
        }
        else
        {
            Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please select a user to start conversation", viewController: self)
        }
        
    }
    //Get list of all users
    func showAllUsers() {
        ACProgressHUD.shared.showHUD()
        UsersAPI.usersQuery { (response, error) in
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"All Users" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else {
                let responseDictionary = response?["response"] as! NSDictionary
                self.allUsersListArray = responseDictionary["users"] as! NSArray
                self.listOfUserTableView.reloadData()
            }
        }
        
    }
 
    //UITableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUsersListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell", for: indexPath)
        let namesDict = allUsersListArray[indexPath.row] as! NSDictionary;
        let firstName = namesDict["first_name"] as! String
        let lastName = namesDict["last_name"] as! String
        cell.textLabel?.text = "\(firstName) \(lastName)"
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = cell.isSelected ? .checkmark : .none

            if (selectedUsersListArray.contains(indexPath.row)) {
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
            else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }

        return cell
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.listOfUserTableView.contentInset = UIEdgeInsetsMake(0,0,55,0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let namesDict = allUsersListArray[indexPath.row] as! NSDictionary;
        let userId = namesDict["id"] as! String
        
            if (selectedUsersListArray.contains(indexPath.row)) {
                
                selectedUsersListArray.remove(indexPath.row)
                selectedUsersIdsArray.remove(userId)
            }
            else {
                
                selectedUsersListArray.add(indexPath.row)
                selectedUsersIdsArray.add(userId)
            }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        let namesDict = allUsersListArray[indexPath.row] as! NSDictionary;
        let userId = namesDict["id"] as! String
        
            if (selectedUsersListArray.contains(indexPath.row)) {
                
                selectedUsersListArray.remove(indexPath.row)
                 selectedUsersIdsArray.remove(userId)
            }

        
    }

}
