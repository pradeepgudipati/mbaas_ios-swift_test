//
//  ViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/13/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

  let imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func testUsersMethod(_ sender: Any) {
    
    let aAPIListViewController = self.storyboard?.instantiateViewController(withIdentifier: "APIListViewController") as! APIListViewController
    self.navigationController?.pushViewController(aAPIListViewController, animated: true)
    
  }
  
  @IBAction func testAclsMethod(_ sender: Any) {
    
    let aACLListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ACLListViewController") as! ACLListViewController
    self.navigationController?.pushViewController(aACLListViewController, animated: true)
    
  }
  
  @IBAction func uploadPhoto(_ sender: Any) {
    
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary;
    imagePicker.allowsEditing = false
    self.present(imagePicker, animated: true, completion: nil)
    
  }
  /*
     This method is used for upload image
 */
  
  func uploadPhotoToServer(imageUploadURL:URL) {
    
    ACProgressHUD.shared.showHUD()

    PhotosAPI.photosCreate(photo:imageUploadURL as URL, title: "IOS test \(Timestamp)", collectionName: "", collectionId: "", tags: "", customFields: nil, aclName: "", aclId: "", suId: "", photoSizes:nil, photoSyncSizes: nil, prettyJson: true) { (response, error) in
      
       ACProgressHUD.shared.hideHUD()

        if (error != nil) {
          
          let alert = UIAlertController(title: "Photo", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
          
        }
        else {
          
          
          let value = response?.description
          
          let alert = UIAlertController(title: "Photo", message:value, preferredStyle: UIAlertControllerStyle.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
          
        }
 
        
        
    }
    
  }
  
  private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    dismiss(animated:true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage

    //Save the image to document directory
    do {
      let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
      let fileURL = documentsURL.appendingPathComponent("\(Timestamp).jpg")
      if let pngImageData = UIImageJPEGRepresentation(image,0.5) {
        try pngImageData.write(to: fileURL, options: .atomic)
      }
    } catch { }
    
    //Get image Path
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let filePath = documentsURL.appendingPathComponent("\(Timestamp).jpg").path
    
    let imageURL = URL(fileURLWithPath: filePath);
    
    dismiss(animated: true, completion: nil)

    self.uploadPhotoToServer(imageUploadURL:imageURL)

  }
  
  var Timestamp: String {
    return "\(NSDate().timeIntervalSince1970 * 1000)"
  }
}

