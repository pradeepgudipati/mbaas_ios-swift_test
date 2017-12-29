//
//  ViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/13/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var baseView: UIView!
    @IBOutlet weak var itemsTableView: UITableView!
    
    let imagePicker = UIImagePickerController()
    var itemsArr = NSMutableArray()
   
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    itemsArr = ["Users","Access Control","Chats","Checkins","Geo Fences","Custom Objects","Photo Collections","Photos","Places","Push Notifications"];
    self.clearDocumentoryFolder()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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

    let currentTimestamp = "\(NSDate().timeIntervalSince1970 * 1000)"

    //Save the image to document directory
    do {
      let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
      let fileURL = documentsURL.appendingPathComponent("\(currentTimestamp).jpg")
      if let pngImageData = UIImageJPEGRepresentation(image,0.5) {
        try pngImageData.write(to: fileURL, options: .atomic)
      }
    } catch { }
    
    //Get image Path
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let filePath = documentsURL.appendingPathComponent("\(currentTimestamp).jpg").path
    
    let imageURL = URL(fileURLWithPath: filePath);
    
    dismiss(animated: true, completion: nil)

    self.uploadPhotoToServer(imageUploadURL:imageURL)

  }
  
  var Timestamp: String {
    return "\(NSDate().timeIntervalSince1970 * 1000)"
  }
  
  
  func clearDocumentoryFolder() {
    let fileManager = FileManager.default
    let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
    let documentsPath = documentsUrl.path
    
    do {
      if let documentPath = documentsPath
      {
        let fileNames = try fileManager.contentsOfDirectory(atPath: "\(documentPath)")
        print("all files in cache: \(fileNames)")
        for fileName in fileNames {
          
          if (fileName.hasSuffix(".png") || fileName.hasSuffix(".jpg"))
          {
            let filePathName = "\(documentPath)/\(fileName)"
            try fileManager.removeItem(atPath: filePathName)
          }
        }
        
        let files = try fileManager.contentsOfDirectory(atPath: "\(documentPath)")
        print("all files in cache after deleting images: \(files)")
      }
      
    } catch {
      print("Could not clear temp folder: \(error)")
    }
  }
    
//TableView Controllor methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.itemsArr.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsTableViewCell")
         cell!.textLabel?.text = self.itemsArr[indexPath.row] as? String
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            let userslistArray: NSMutableArray = ["Create User","Login User","Show Current User","Update Current User","Remove User","Logout Current User","Query User"];
        
            navigateToApiListViewController(userlist: true, cllist: false, chatlist: false,checkinlist:false,customObj:false,geoFecList:false,photoCollection:false,placeslist:false, listArray: userslistArray)

            break
        case 1:
            let cllistArray: NSMutableArray = ["Create ACL","Show ACL","Update User in ACL","Check Permission of ACL"]

            navigateToApiListViewController(userlist: false, cllist: true, chatlist: false,checkinlist:false,customObj:false,geoFecList:false,photoCollection:false,placeslist:false, listArray: cllistArray)

            break
        case 2:
            let chatListArray: NSMutableArray = ["Query Chat Groups","Create New Group"]
            

            navigateToApiListViewController(userlist: false, cllist: false, chatlist: true,checkinlist:false,customObj:false,geoFecList:false,photoCollection:false,placeslist:false, listArray: chatListArray)

            break
        case 3:
            
            let checkinArray: NSMutableArray = ["Create Checkin","Query Checkin"]
            navigateToApiListViewController(userlist: false, cllist: false, chatlist: false, checkinlist: true,customObj:false,geoFecList:false,photoCollection:false,placeslist:false, listArray: checkinArray)
            break
        case 4:
            let geoFencArray: NSMutableArray = ["Create Geo Fence","Query Geo Fence"]
            
            navigateToApiListViewController(userlist: false, cllist: false, chatlist: false, checkinlist: false,customObj:false,geoFecList:true,photoCollection:false,placeslist:false, listArray: geoFencArray)
            break
        case 5:
            let customObj: NSMutableArray = ["Create Custom Object","Query Custom Object"]
            
            navigateToApiListViewController(userlist: false, cllist: false, chatlist: false, checkinlist: false,customObj:true,geoFecList:false,photoCollection:false,placeslist:false, listArray: customObj)
            break
        case 6:
            let photoClctn: NSMutableArray = ["Create Photo Collection","Search Photo Collection"]
            
            navigateToApiListViewController(userlist: false, cllist: false, chatlist: false, checkinlist: false,customObj:false,geoFecList:false,photoCollection:true,placeslist:false,  listArray: photoClctn)

            break
        case 8 :
            let placeslistArray: NSMutableArray = ["Create Place","Query Place","Search Place"];
            navigateToApiListViewController(userlist: false, cllist: false, chatlist: false, checkinlist: false,customObj:false, geoFecList: false,photoCollection:false,placeslist:true, listArray: placeslistArray)
//        case 5:
//            showAllUsers()
//            break

            
        default:
            break
            
        }
    }
    

    func navigateToApiListViewController(userlist:Bool,cllist:Bool,chatlist:Bool,checkinlist:Bool,customObj:Bool,geoFecList:Bool,photoCollection:Bool,placeslist:Bool,listArray: NSMutableArray){

        let aAPIListViewController = self.storyboard?.instantiateViewController(withIdentifier: "APIListViewController") as! APIListViewController
        aAPIListViewController.listArray = listArray
        aAPIListViewController.usersList = userlist
        aAPIListViewController.cllist = cllist
        aAPIListViewController.chatlist = chatlist
        aAPIListViewController.checkinlist = checkinlist
        aAPIListViewController.customObject = customObj
        aAPIListViewController.geoFencList = geoFecList
        aAPIListViewController.photoCollection = photoCollection
        aAPIListViewController.placeslist = placeslist
        self.navigationController?.pushViewController(aAPIListViewController, animated: true)

    }
}

