//
//  UpdateorDeletePhotoViewController.swift
//  Axway-Test
//
//  Created by vamshi Krishna Sajjana on 12/28/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class UpdateorDeletePhotoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var place: NSString = ""
    var id: NSString = ""
   
    let imagePicker = UIImagePickerController()
    var imageUrl : NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func updatePhoto(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func upDatePhoto(){
        ACProgressHUD.shared.showHUD()
        let fileUrl = NSURL(fileURLWithPath: imageUrl as String) as URL
        PhotosAPI.photosUpdate(photoId: id as String, photo: fileUrl as NSURL, title: nil, collectionName: nil, collectionId: nil, tags: nil, customFields: nil, aclName: nil, aclId: nil, photoSizes: nil, photoSyncSizes: nil, suId: nil, prettyJson: nil, completion: {(response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else {
                let value = response?.description
                let alert = UIAlertController(title: "Updated Photo Successfully", message:value, preferredStyle: UIAlertControllerStyle.alert)
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
    
    @IBAction func deletePhoto(_ sender: Any) {
        ACProgressHUD.shared.showHUD()
        PhotosAPI.photosDelete(photoId: id as String, completion: {(response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else{
                let value = response?.description
                let alert = UIAlertController(title: "Deleted Photo Successfully", message:value, preferredStyle: UIAlertControllerStyle.alert)
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
    
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @nonobjc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        } else{
            print("Something went wrong",AnyObject.self)
        }
        saveImageDocumentDirectory()
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveImageDocumentDirectory(){
        // create a name for your image
        
//        let number = (arc4random_uniform(101))
//        var name = String(number);
//        name = "\(name) \(".png")"
        let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        // create a name for your image
        let fileURL = documentsDirectoryURL.appendingPathComponent(place as String)
        let fileManager = FileManager.default
        if FileManager.default.fileExists(atPath: fileURL.path){
            do {
                try fileManager.removeItem(atPath: fileURL.path)
            }
            catch let error as NSError {
                print("Ooops! Something went wrong: \(error)")
            }
        }
        
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try UIImagePNGRepresentation(imageView.image!)!.write(to: fileURL)
                imageUrl = fileURL.path as NSString
                if imageUrl != ""
                {
                    upDatePhoto()
                }
                
                print("Image Added Successfully",imageUrl)
            } catch {
                print(error)
            }
        } else {
            print("Image Not Added")
        }
    }
}
