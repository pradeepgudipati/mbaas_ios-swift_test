//
//  ShowChatsViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 18/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ShowChatsViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var chatTxtField: UITextField!
    var chatGroupId:String = ""
    var participateIds:String = ""
    var chatId:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatsQuery()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Chats" , messageStr: value!, viewController: self)
                
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
                let value = response?.description
                 Utils.showAlertWithOkButton(titleStr:"Chats" , messageStr: value!, viewController: self)
                
            }
            
        }
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let textStr: String = textField.text!
        
        if textStr.characters.count > 0
        {
            createChats()
        }
        resignFirstResponder()
        return true
    }
    
    

}
