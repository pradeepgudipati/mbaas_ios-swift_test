//
//  CreateOrUpdateACLViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/15/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit
enum updationType: Int {
    case Create = 1, Update
}

class CreatePlaceViewController: UIViewController,UITextFieldDelegate {
    
  
    var operationTypeValue:updationType = .Create

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var postalCode: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    var currentTag:Int = 100
    var isUpdateUser: Bool = false
    var placeId: NSString = ""
    var userId: NSString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch operationTypeValue {
        case updationType.Create:
            isUpdateUser = false
            createBtn.setTitle("Create Place",for: .normal)
            break;
        case updationType.Update:
            isUpdateUser = true
            createBtn.setTitle("Update Place",for: .normal)

            getPlaceToUpdate()
            break;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CreatePlaceAction(_ sender: Any) {
        if(isUpdateUser){
            updatePlaceApi()
        }
        else{
            if validateTextField() {
                createPlaceApi();
            }
        }
    }
    
    func updatePlaceApi(){
        ACProgressHUD.shared.showHUD()
        PlacesAPI.placesUpdate(placeId: placeId as String, name: name.text, address: adress.text, city: city.text, state: state.text, postalCode: postalCode.text, country: country.text, latitude: (latitude.text! as NSString).doubleValue, longitude: (longitude.text! as NSString).doubleValue, website: nil, twitter: nil, phoneNumber: nil, photo: nil, photoId: nil, tags: nil, customFields: nil, aclName: nil, aclId: nil, userId: nil, suId: nil, prettyJson: true, completion: {(response, error) in
        
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else {
                let value = response?.description
                let alert = UIAlertController(title: "Update Place Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction!) -> Void in
                    
                    for vc in (self.navigationController?.viewControllers ?? []) {
                        if vc is APIListViewController {
                            _ = self.navigationController?.popToViewController(vc, animated: true)
                            break
                        }
                    }                    
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
        });
    }

    
    
    
    func createPlaceApi(){
        ACProgressHUD.shared.showHUD()
        PlacesAPI.placesCreate(name: name.text!, address: adress.text!, city: city.text!, state: state.text!, postalCode: postalCode.text!, country: country.text!, latitude:  (latitude.text! as NSString).doubleValue, longitude: (longitude.text! as NSString).doubleValue, website: nil, twitter: nil, phoneNumber: nil, photo: nil, photoId: nil, tags: nil, customFields: nil, aclName: nil, aclId: nil, suId: nil, prettyJson: nil){
            (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else {
                let value = response?.description
                let alert = UIAlertController(title: "Create Place Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction!) -> Void in
                    
                    self.navigationController?.popViewController(animated: true)
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    

    
    func getPlaceToUpdate(){
        ACProgressHUD.shared.showHUD()
        PlacesAPI.placesShow(placeId: self.placeId as String, responseJsonDepth: nil, showUserLike: nil, prettyJson: nil, completion: {(response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else {
                let value = response?.description
                if response!["response"] != nil{
                    
                    let responseDictionary = response?["response"] as! NSDictionary
                    let arr = responseDictionary["places"] as! NSArray
                    let dict = arr[0] as? NSDictionary
                    self.adress.text = dict?["address"] as? String;
                    self.city.text = dict?["city"] as? String;
                    self.country.text = dict?["country"] as? String;
                    self.latitude.text =    String(format:"%f", (dict?["latitude"] as? Double)!)
                    self.longitude.text =   String(format:"%f", (dict?["longitude"] as? Double)!);
                    self.name.text = dict?["name"] as? String;
                    self.postalCode.text = dict?["postal_code"] as? String;
                    self.state.text = dict?["state"] as? String;
                    self.placeId = dict?["id"] as! NSString
                    self.userId = dict?["user_id"] as! NSString;

                }
            }
        });
}

    
    
    
    
    
    
    /* validating text fields*/
    
    func validateTextField() -> Bool{
        
        if (name.text?.isEmpty)! || name.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter name", viewController: self)
            return false
        }
        else if (adress.text?.isEmpty)! || adress.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter address", viewController: self)
            return false
        }
        else if (city.text?.isEmpty)! || city.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter city", viewController: self)
            return false
        }
        else if (state.text?.isEmpty)! || state.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter state", viewController: self)
            return false
        }
        else if (postalCode.text?.isEmpty)! || postalCode.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter Postal Code", viewController: self)
            return false
        }
        else if (country.text?.isEmpty)! || country.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter  country", viewController: self)
            return false
        }
        else if (latitude.text?.isEmpty)! || postalCode.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter latitude", viewController: self)
            return false
        }
        else if (longitude.text?.isEmpty)! || longitude.text == nil
        {
            Utils.showAlertWithOkButton(titleStr:"Alert", messageStr:"Please enter  longitude", viewController: self)
            return false
        }

        else
        {
            return true
        }
    }
    
    /* UIToolbar methods for previous,next and done options */
    
    var inputToolbar: UIToolbar = {
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
            adress.becomeFirstResponder()
        }
        else if currentTag == 101{
            city.becomeFirstResponder()
        }
        else if currentTag == 102{
            state.becomeFirstResponder()
        }
        else if currentTag == 103{
            postalCode.becomeFirstResponder()
        }
        else if currentTag == 104{
            country.becomeFirstResponder()
        }
        else if currentTag == 105{
            latitude.becomeFirstResponder()
        }
        else if currentTag == 106{
            longitude.becomeFirstResponder()
        }
        else if currentTag == 107
        {
            self.view.endEditing(true)
        }
    }
    
    func keyboardPreviousButton(_sender : Any){
         if currentTag == 101{
            name.becomeFirstResponder()
        }
        else if currentTag == 102{
            adress.becomeFirstResponder()
        }
        else if currentTag == 103{
            city.becomeFirstResponder()
        }
        else if currentTag == 104{
            state.becomeFirstResponder()
        }
        else if currentTag == 105{
            postalCode.becomeFirstResponder()
        }
        else if currentTag == 106{
            country.becomeFirstResponder()
        }
         else if currentTag == 107{
            latitude.becomeFirstResponder()
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
    

