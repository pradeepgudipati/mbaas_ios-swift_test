//
//  PhotoClctnOptionsViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 27/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class PhotoClctnOptionsViewController: UIViewController {

      var photoCollectionID:String = ""
      var photoName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPhotos(_ sender: Any) {
        
        let showPhotos = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotosInfoViewController") as! ShowPhotosInfoViewController
        showPhotos.isShowPhotos = true
        showPhotos.photoCollectionID = photoCollectionID
        self.navigationController?.pushViewController(showPhotos, animated: true)
        
    }
    @IBAction func showSubCollection(_ sender: Any) {
        let showPhotos = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotosInfoViewController") as! ShowPhotosInfoViewController
        showPhotos.isShowPhotos = false
        showPhotos.photoCollectionID = photoCollectionID
        self.navigationController?.pushViewController(showPhotos, animated: true)
        
    }
    @IBAction func update(_ sender: Any) {
        let navCreatePhotos = self.storyboard?.instantiateViewController(withIdentifier: "CreatePhotoClctnViewController") as! CreatePhotoClctnViewController
        navCreatePhotos.isUpdate = true
        navCreatePhotos.photoCollectionID = photoCollectionID
        navCreatePhotos.photoName = photoName
        self.navigationController?.pushViewController(navCreatePhotos, animated: true)
    }
    @IBAction func remove(_ sender: Any) {
        let alert = UIAlertController(title: "Delete", message:"Are you sure you want to delete", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:nil))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alert -> Void in
            
            self.deletePhotoCollection()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func deletePhotoCollection()
    {
        ACProgressHUD.shared.showHUD()
        PhotoCollectionsAPI.photoCollectionsDelete(collectionId: photoCollectionID) { (response, error) in
            
             ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else
            {
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr:"Deleted Successfully", viewController: self)
            }
        }
    }
    

}
