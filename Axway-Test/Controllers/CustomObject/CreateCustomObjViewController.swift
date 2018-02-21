//
//  CreateCustomObjViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 21/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class CreateCustomObjViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var classNameTxt: UITextField!
    @IBOutlet weak var newPropertyTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    var tagVal:Int = 100
    var fieldDict: NSMutableDictionary = [:]
    let fieldsArr:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addNewPropertyAction(_ sender: Any) {
        
        if newPropertyTxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please add atlest one new property key", viewController: self)
        }
        else
        {
            var textFrame: CGRect = CGRect(x: classNameTxt.frame.origin.x, y: createBtn.frame.origin.y + createBtn.frame.size.height + 30, width: classNameTxt.frame.size.width, height: classNameTxt.frame.size.height)
            if tagVal == 100
            {
                textFrame = CGRect(x: classNameTxt.frame.origin.x, y: createBtn.frame.origin.y + createBtn.frame.size.height + 30, width: classNameTxt.frame.size.width, height: classNameTxt.frame.size.height)
            }
            else
            {
                for vw in  self.view.subviews
                {
                    if vw.tag == tagVal
                    {
                       textFrame = CGRect(x: vw.frame.origin.x, y: vw.frame.origin.y + vw.frame.size.height + 30, width: vw.frame.size.width, height: vw.frame.size.height)
                    }
                }
            }
            tagVal = tagVal + 1
            let sampleTextField =  UITextField(frame: textFrame)
            sampleTextField.placeholder = newPropertyTxt.text!
            sampleTextField.tag = tagVal
            sampleTextField.font = UIFont.systemFont(ofSize: 14)
            sampleTextField.borderStyle = UITextBorderStyle.bezel
            sampleTextField.autocorrectionType = UITextAutocorrectionType.no
            sampleTextField.keyboardType = UIKeyboardType.default
            sampleTextField.returnKeyType = UIReturnKeyType.done
            sampleTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
            sampleTextField.delegate = self
            self.view.addSubview(sampleTextField)
        }
    }
    
    @IBAction func createObjAction(_ sender: Any) {
        
        if classNameTxt.text!.characters.count == 0
        {
         Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter class name", viewController: self)
        }
        else
        {

            for vw in  self.view.subviews
            {
                if vw.tag > 100
                {
                     let sampleTextField  = vw as! UITextField
                     //fieldsStr = sampleTextField.text!
                     fieldDict = [sampleTextField.placeholder! : sampleTextField.text!]
                     //fieldsArr.add(fieldDict)
                }
            }
            createCustomObj()
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createCustomObj(){
        do{
            let data = try JSONSerialization.data(withJSONObject: fieldDict, options: .init(rawValue: 0)) as Data
            
            let fieldStr = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            
            ACProgressHUD.shared.showHUD()

            CustomObjectsAPI.customObjectsCreate(classname: classNameTxt.text!, fields: fieldStr! as String, prettyJson: nil , tags: nil , photo: nil , photoId: nil , aclName: nil , aclId: nil , suId:  nil ) { (response, error) in
                ACProgressHUD.shared.hideHUD()

                if (error != nil) {
                    
                    Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                    
                }
                else {
                    
                    
                    let value = response?.description
                    Utils.showAlertWithOkButton(titleStr: "Create Custom Object", messageStr: value! , viewController: self)
                    
                }
                
            }
        }
        catch _{
        print("error")
        }
    }
    
    

}
