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
    
    var currentTag:Int = 100
    
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
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction!) -> Void in
                    
                    self.navigationController?.popViewController(animated: true)
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
        
    }
    
    /* validating text fields*/
    
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
    
    /* UIToolbar methods for previous,next and done options */
    
    lazy var inputToolbar: UIToolbar = {
        var toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.backgroundColor = UIColor.lightGray
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneBtnAction(sender:)))
        var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        var nextButton  = UIBarButtonItem(title: ">", style: UIBarButtonItemStyle.done, target: self, action: #selector(keyboardNextButton(_sender:)))
        nextButton.width = 50.0
        var previousButton  = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.done, target: self, action: #selector(keyboardPreviousButton(_sender:)))
    
        toolbar.setItems([fixedSpaceButton,previousButton, fixedSpaceButton, nextButton, flexibleSpaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true

        return toolbar
    }()

    
    func keyboardNextButton(_sender : Any){
        
        if currentTag == 100{
            lastName.becomeFirstResponder()
        }
        else if currentTag == 101{
            userName.becomeFirstResponder()
        }
        else if currentTag == 102{
            emailId.becomeFirstResponder()
        }
        else if currentTag == 103{
            password.becomeFirstResponder()
        }
        else if currentTag == 104{
            confirmPassword.becomeFirstResponder()
        }
        else if currentTag == 105
        {
            self.view.endEditing(true)
        }
    }
    
    func keyboardPreviousButton(_sender : Any){
        
        if currentTag == 105{
            password.becomeFirstResponder()
        }
        else if currentTag == 104{
            emailId.becomeFirstResponder()
        }
        else if currentTag == 103{
            userName.becomeFirstResponder()
        }
        else if currentTag == 102{
            lastName.becomeFirstResponder()
        }
        else if currentTag == 101{
            firstName.becomeFirstResponder()
        }
        
    }
    
    /* UITextField Methods*/
    func doneBtnAction(sender:Any)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = inputToolbar
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
       currentTag = textField.tag
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}
