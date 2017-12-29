//
//  ShowPhotosInfoViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 28/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ShowPhotosInfoViewController: UIViewController {

    var isShowPhotos:Bool = false
    var photoCollectionID:String = ""
    @IBOutlet weak var showPhotosTxtVw: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isShowPhotos
        {
            showPhotosApi()
        }
        else
        {
            showSubCollectionApi()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Photos collection api
    func showPhotosApi(){
        
        ACProgressHUD.shared.showHUD()
        PhotoCollectionsAPI.photoCollectionsShowPhotos(collectionId: photoCollectionID) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                let value = response?.description
                self.showPhotosTxtVw.text = value
                
            }
            
        }
        
    }

    func showSubCollectionApi(){
        
        ACProgressHUD.shared.showHUD()
        PhotoCollectionsAPI.photoCollectionsShowSubcollections(collectionId: photoCollectionID) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                let value = response?.description
                self.showPhotosTxtVw.text = value
                
            }
            
        }
        
    }
}
