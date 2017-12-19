//
//  ShowChatsViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 18/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ShowChatsViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var chatTxtField: UITextField!
    @IBOutlet weak var chatsTableView: UITableView!
    
    var chatsArr:NSArray = []
    
    var chatGroupId:String = ""
    var participateIds:String = ""
    var chatId:String = ""
    var queryWhere:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatsQuery()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.chatsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatsCell")
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        
        let chatDict = self.chatsArr[indexPath.row] as! NSDictionary
        let messageStr = chatDict["message"] as! String
        let namesDict = chatDict["from"] as! NSDictionary
        let firstName = namesDict["first_name"] as! String
        let lastName = namesDict["last_name"] as! String
        cell!.textLabel?.numberOfLines = 2
        cell!.textLabel?.text = "\(messageStr) \n\(firstName) \(lastName)"
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func chatsQuery(){
        ACProgressHUD.shared.showHUD()
        
        ChatsAPI.chatsQuery(participateIds: self.participateIds, chatGroupId: self.chatGroupId, page: nil, perPage: nil, prettyJson: nil, limit: nil, skip: nil, where_: nil
        , order: nil, sel: nil, unsel: nil, responseJsonDepth: 3) { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else
            {
                //let value = response?.description
                let responseDictionary = response?["response"] as! NSDictionary
                self.chatsArr = responseDictionary["chats"] as! NSArray
                if self.chatsArr.count > 0
                {
                    let chatDict = self.chatsArr[0] as! NSDictionary
                    self.queryWhere = chatDict["updated_at"] as! String
                }
                self.chatsTableView.reloadData()
               // Utils.showAlertWithOkButton(titleStr:"Chats" , messageStr: value!, viewController: self)
                
            }
            
        }
        
    }
    
    
    //Create chats api call
    func createChats(){
         ACProgressHUD.shared.showHUD()
        ChatsAPI.chatsCreate(toIds: participateIds, chatGroupId: chatGroupId, message: chatTxtField.text!, photo: nil, photoId: nil, customFields: nil, channel: nil, payload: nil, suId: nil, responseJsonDepth: nil, prettyJson: nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else
            {
                self.chatsQuery()
                
            }
        }
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let textStr: String = textField.text!
        
        if textStr.characters.count > 0
        {
            resignFirstResponder()
            createChats()
        }
       
        return true
    }
    
    
 
    

}
