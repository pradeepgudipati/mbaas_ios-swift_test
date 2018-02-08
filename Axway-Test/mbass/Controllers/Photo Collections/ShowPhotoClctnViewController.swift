//
//  ShowPhotoClctnViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 27/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ShowPhotoClctnViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 @IBOutlet weak var photoClctnTableView: UITableView!
    var photosClctnArr:NSArray = []
    var isFromCreate:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showListOfPhotoCollections()
        self.photoClctnTableView.allowsMultipleSelection = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func showListOfPhotoCollections()
   {
    
    if UserDefaults.standard.object(forKey: "userId") != nil
    {
        //obtaining stored userid to get user information
        let userDefaults = UserDefaults.standard
        let useridstr  = userDefaults.string(forKey: "userId")
        if ( useridstr?.characters.count != 0)
        {
            ACProgressHUD.shared.showHUD()
            
            PhotoCollectionsAPI.photoCollectionsSearch(userId: useridstr!, completion: { (response, error) in
                
            ACProgressHUD.shared.hideHUD()
                
                if (error != nil) {
                    
                    Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                    
                }
                else {
                    let responseDictionary = response?["response"] as! NSDictionary
                    self.photosClctnArr = responseDictionary["collections"] as! NSArray
                    self.photoClctnTableView.reloadData()
                    
                    
                }
            })
                
        }
        else
        {
            Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please login to get user details", viewController: self)
        }
    }
    else
    {
        Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please login to get user details", viewController: self)
    }
   
    }

    //UITableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.photosClctnArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoClctnCell")
        let photoDict = self.photosClctnArr[indexPath.row] as! NSDictionary
        cell!.textLabel?.text = (photoDict["name"] as! String)
        
        if isFromCreate
        {
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoDict = self.photosClctnArr[indexPath.row] as! NSDictionary
        
        if isFromCreate
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            let userDefaults = UserDefaults.standard
            userDefaults.set(photoDict["id"] as! String, forKey: "collectionId")
            userDefaults.set(photoDict["name"] as! String, forKey: "collectionName")
            self.navigationController?.popViewController(animated: true)
            
        }
        else
        {
            let showOptions = self.storyboard?.instantiateViewController(withIdentifier: "PhotoClctnOptionsViewController") as! PhotoClctnOptionsViewController
            showOptions.photoCollectionID = photoDict["id"] as! String
            showOptions.photoName = photoDict["name"] as! String
            self.navigationController?.pushViewController(showOptions, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    
}
