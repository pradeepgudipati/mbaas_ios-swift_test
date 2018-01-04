//
//  CreatePhotoClctnViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 27/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class CreatePhotoClctnViewController: UIViewController {

    var isUpdate:Bool = false
    var photoCollectionID:String = ""
    var photoName:String = ""
    var parentClctnId:String = ""
    var collectionName:String = ""
    
    @IBOutlet weak var chooseParentBtn: UIButton!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "collectionId") != nil
        {
            let userDefaults = UserDefaults.standard
            parentClctnId  = userDefaults.string(forKey: "collectionId")!
            collectionName = userDefaults.string(forKey: "collectionName")!
            nameTxt.text = collectionName
        }
        if isUpdate
        {
            createBtn.setTitle("Update", for: UIControlState.normal)
            chooseParentBtn.isHidden = true
            nameTxt.text = photoName
        }
        else
        {
            createBtn.setTitle("Create", for: UIControlState.normal)
            chooseParentBtn.isHidden = false
        } 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseparentBtnAction(_ sender: Any) {
        
        let showPhotoList = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotoClctnViewController") as! ShowPhotoClctnViewController
        showPhotoList.isFromCreate = true
        self.navigationController?.pushViewController(showPhotoList, animated: true)
    }
    
    @IBAction func createBtnAction(_ sender: Any) {
        if nameTxt.text!.characters.count > 0
        {
        if !isUpdate
        {
            createPhotoCollection()
        }
        else
        {
            updatePhotoCollection()
        }
        }
        else
        {
           Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: "Please enter name", viewController: self)
        }
    }
        
    
    func createPhotoCollection(){
        
        ACProgressHUD.shared.showHUD()
     
        PhotoCollectionsAPI.photoCollectionsCreate(name: nameTxt.text, parentCollectionId:parentClctnId.characters.count>0 ? parentClctnId : nil, coverPhotoId: nil, customFields: nil, aclName: nil, aclId: nil, suId: nil, prettyJson: nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            let userDefaults = UserDefaults.standard
            userDefaults.set("", forKey: "collectionId")
            userDefaults.set("", forKey: "collectionName")
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
            }
        }
        
    }
    
    func updatePhotoCollection(){
        
        ACProgressHUD.shared.showHUD()
        PhotoCollectionsAPI.photoCollectionsUpdate(collectionId: photoCollectionID, name:nameTxt.text , coverPhotoId: nil, customFields: nil, aclName: nil, aclId: nil, suId: nil, prettyJson: nil) { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
            }
            
        }
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
