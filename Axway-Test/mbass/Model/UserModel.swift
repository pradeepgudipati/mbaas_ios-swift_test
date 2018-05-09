//
//  UserModel.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 11/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import Foundation
import UIKit

class UserModel{
    
    var firstName:String = ""
    var lastName:String = ""
    var userName:String = ""
    var emailID:String = ""
    var password:String = ""
    var confirmPassword:String = ""
    
    init?(firstName:String,lastName:String,userName:String,emailID:String,password:String,confirmPassword:String){
        
        if firstName.isEmpty {
            return nil
        }
        else if lastName.isEmpty{
            return nil
        }
        else if userName.isEmpty{
            return nil
        }
        else if emailID.isEmpty{
            return nil
        }
        else if password.isEmpty{
            return nil
        }
        else if confirmPassword.isEmpty{
            return nil
        }
        else
        {
            self.firstName = firstName
            self.lastName = lastName
            self.userName = userName
            self.emailID = emailID
            self.password = password
            self.confirmPassword = confirmPassword
        }
        
    }
    
}

