//
//  DisplayGroupChatsViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 19/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class DisplayGroupChatsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var displayChatsTable: UITableView!
    var chatGroupId:String = ""
    var participateIds:String = ""
    var listArr:NSMutableArray = []
    var chatsArr:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getchatsGroup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getchatsGroup()
    {
        ACProgressHUD.shared.showHUD()
        
        ChatsAPI.chatsGetChatGroups(page: nil , perPage: nil , where_: nil , order: nil , responseJsonDepth: 3 , prettyJson: nil){(response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"All Users" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else{
                //let value = response?.description
                if response!["response"] != nil{
                    let responsDict = response?["response"] as! NSDictionary
                    self.chatsArr = responsDict["chat_groups"] as! NSArray
                    
                    for partcpntsDict in self.chatsArr
                    {
                        let participentsDict = partcpntsDict as! NSDictionary
                        let participentsArr = participentsDict["participate_users"] as! NSArray
                        if participentsArr.count>0
                        {
                            var nameStr:String = ""
                            for respDict in participentsArr
                            {
                                let resDict = respDict as! NSDictionary
                                if nameStr.characters.count == 0
                                {
                                    nameStr = resDict["first_name"] as! String
                                }
                                else
                                {
                                    let firstNameStr =  resDict["first_name"] as! String
                                    nameStr +=  "," + firstNameStr
                                }
                            }
                            self.listArr.add(nameStr)
                            self.displayChatsTable.reloadData()
                        }
                    }
                }
            }
        }
    }
    //UITableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupChatsCell")
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        cell!.textLabel?.text = self.listArr[indexPath.row] as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let showChatsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowChatsViewController") as! ShowChatsViewController
        
        if self.chatsArr.count > 0
        {
            let participentsDict = self.chatsArr[indexPath.row] as! NSDictionary
            showChatsViewController.chatGroupId = participentsDict["id"] as! String
            let participentsArr = participentsDict["participate_users"] as! NSArray
            if participentsArr.count>0
            {
                var participentIds:String = ""
                for respDict in participentsArr
                {
                    let resDict = respDict as! NSDictionary
                    if participentIds.characters.count == 0
                    {
                        participentIds = resDict["id"] as! String
                    }
                    else
                    {
                        let idStr =  resDict["id"] as! String
                        participentIds +=  "," + idStr
                    }
                }
                showChatsViewController.participateIds = participentIds
            }
            self.navigationController?.pushViewController(showChatsViewController, animated: true)
            
        }
        
        
    }

}
