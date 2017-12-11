//
//  CreateUserViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 11/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var firstName:UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var emailId:  UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createUserBtnAction(_ sender: Any) {
        if validateTextField() {
        ACProgressHUD.shared.showHUD()
            UsersAPI.usersCreate(email: emailId.text, username: userName.text, password: password.text!, passwordConfirmation: confirmPassword.text!, firstName: firstName.text, lastName: lastName.text,  tags:nil, customFields: "", aclName: "", aclId: "", suId: nil, role: "", template: "", confirmationTemplate: "", prettyJson: true) {
            (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                let alert = UIAlertController(title: "Create Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else {
                let value = response?.description
                let alert = UIAlertController(title: "Create User Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
        
    }
    func validateTextField() -> Bool{
        
        if (firstName.text?.isEmpty)! || firstName.text == nil
        {
           Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter firstname", viewController: self)
            return false
        }
        else if (lastName.text?.isEmpty)! || lastName.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter lastname", viewController: self)
            return false
        }
        else if (userName.text?.isEmpty)! || userName.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter username", viewController: self)
            return false
        }
        else if (emailId.text?.isEmpty)! || emailId.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter emailid", viewController: self)
            return false
        }
        else if (password.text?.isEmpty)! || password.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter password", viewController: self)
            return false
        }
        else if (confirmPassword.text?.isEmpty)! || confirmPassword.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter confirm password", viewController: self)
            return false
        }
        else
        {
            return true
        }
        
    }
    

}
