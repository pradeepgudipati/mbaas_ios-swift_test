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
    var isFromCreateChat:Bool = false
    
    var chatsArr:NSArray = []
    var chatGroupId:String = ""
    var participateIds:String = ""
    var chatId:String = ""
    var queryWhere:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isFromCreateChat
        {
        chatsQuery()
        }
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
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            let chatDict = self.chatsArr[indexPath.row] as! NSDictionary
            let chtId = chatDict["id"] as! String
            let alert = UIAlertController(title: "Delete", message:"Are you sure you want to delete", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:nil))
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alert -> Void in
                
               self.deleteChat(chatId:chtId)
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }

    func chatsQuery(){
        ACProgressHUD.shared.showHUD()
        
        do {
            var jsonStr:NSString = ""
            if isFromCreateChat
             {
                let dict:NSMutableDictionary = [:]
                dict.setValue(self.queryWhere, forKey: "$gt")
                
                let updateDict:NSMutableDictionary = [:]
                updateDict.setValue(dict, forKey: "updated_at")
                
                let whereDict:NSMutableDictionary = [:]
                whereDict.setValue(updateDict, forKey: "where")
                let data = try JSONSerialization.data(withJSONObject: whereDict, options: .init(rawValue: 0)) as Data
                
                jsonStr = NSString(data: data, encoding: String.Encoding.utf8.rawValue)!
             }
        
            ChatsAPI.chatsQuery(participateIds: self.participateIds, chatGroupId: (isFromCreateChat ? nil : self.chatGroupId), page: nil, perPage: nil, prettyJson: nil, limit: nil, skip: nil, where_: jsonStr as String?
        , order: nil, sel: nil, unsel: nil, responseJsonDepth: 3) { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else
            {
                if let val = response?["response"]{
                    print(val)
                let responseDictionary = response?["response"] as! NSDictionary
                self.chatsArr = responseDictionary["chats"] as! NSArray
                if self.chatsArr.count > 0
                {
                    let chatDict = self.chatsArr[0] as! NSDictionary
                    self.queryWhere = chatDict["updated_at"] as! String
                }
                self.chatsTableView.reloadData()
               
                }
                else
                {
                     let value = response?.description
                   Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                }
                
            }
            
        }
        }
        catch {
            print("Error")
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
                if self.isFromCreateChat
                {
                    if response!["response"] != nil
                    {
                    let responseDictionary = response?["response"] as! NSDictionary
                    let responseArr = responseDictionary["chats"] as! NSArray
                    let dict = responseArr[0] as! NSDictionary
                    //self.chatGroupId = dict["id"] as! String
                    self.queryWhere = dict["updated_at"] as! String
                    self.chatsQuery()
                    }
                    else
                    {
                        
                        let value = response?.description
                        Utils.showAlertWithOkButton(titleStr:"Fail" , messageStr: value!, viewController: self)
                        
                    }
                }
               
                
            }
        }
    }
    
    //delete chat to delete particular chat data
    func deleteChat(chatId : String){
        
         ACProgressHUD.shared.showHUD()
        ChatsAPI.chatsDelete(chatId:chatId) { (response, error) in
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
