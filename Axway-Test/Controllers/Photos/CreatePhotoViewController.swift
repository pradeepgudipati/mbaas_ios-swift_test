//
//  CreatePhotoViewController.swift
//  Axway-Test
//
//  Created by vamshi Krishna Sajjana on 12/28/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class CreatePhotoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    let imagePicker = UIImagePickerController()
    var imageUrl : NSString = ""
    var parentClctnId:String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func PhotoFromGallery(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)

    }
    @IBAction func photoFromCamera(_ sender: Any) {
    }
    @IBAction func chooseCollection(_ sender: Any) {
        let showPhotoList = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotoClctnViewController") as! ShowPhotoClctnViewController
        showPhotoList.isFromCreate = true
        self.navigationController?.pushViewController(showPhotoList, animated: true)
    }
    @IBAction func createPhoto(_ sender: Any) {
        
        if imageUrl.length == 0{
           Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: "Please select an image from gallery", viewController: self)
            return
        }
    
        if UserDefaults.standard.object(forKey: "collectionId") != nil
        {
           let userDefaults = UserDefaults.standard
           parentClctnId  = userDefaults.string(forKey: "collectionId")!
           userDefaults.removeObject(forKey: "collectionId")
        }
        ACProgressHUD.shared.showHUD()
    
        let fileUrl = NSURL(fileURLWithPath: imageUrl as String) as URL
        

        PhotosAPI.photosCreate(photo: fileUrl , title: nil, collectionName: nil, collectionId: parentClctnId, tags: nil, customFields: nil, aclName: nil, aclId: nil, suId: nil, photoSizes: nil, photoSyncSizes: nil, prettyJson: nil, completion: {(response, error) in

            
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else {
                let value = response?.description
                let alert = UIAlertController(title: "Photo uploded Sucessfully", message:value, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction!) -> Void in
                    
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
        });
        
    }
    
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        } else{
            print("Something went wrong",AnyObject.self)
        }
        saveImageDocumentDirectory()
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
        
    }
    
    func saveImageDocumentDirectory(){
        // create a name for your image
        
        let number = (arc4random_uniform(101))
        var name = String(number);
        name = "\(name) \(".png")"
        let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        // create a name for your image
        let fileURL = documentsDirectoryURL.appendingPathComponent(name)
        
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try UIImagePNGRepresentation(imageView.image!)!.write(to: fileURL)
                imageUrl = fileURL.path as NSString
                print("Image Added Successfully",imageUrl)
            } catch {
                print(error)
            }
        } else {
            print("Image Not Added")
        }
    }

}
