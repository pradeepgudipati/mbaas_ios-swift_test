//
//  QueryViewController.swift
//  Axway-Test
//
//  Created by vamshi Krishna Sajjana on 12/28/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class QueryPhotoViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!

    var photoNameArr: NSMutableArray = []
    var photoIdArray: NSMutableArray = []


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.separatorStyle = .none
        self.tableView.isHidden = true
        getimages()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell!.textLabel?.text = photoNameArr[indexPath.row] as? String
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let updateorDeletePhotoViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateorDeletePhotoViewController") as! UpdateorDeletePhotoViewController
        updateorDeletePhotoViewController.place = self.photoNameArr[indexPath.row] as! NSString
        updateorDeletePhotoViewController.id = self.photoIdArray[indexPath.row] as! NSString
        self.navigationController?.pushViewController(updateorDeletePhotoViewController, animated: true)
    }

    func getimages(){
    
        ACProgressHUD.shared.showHUD()
        PhotosAPI.photosQuery(page: nil, perPage: nil, limit: nil, skip: nil, where_: nil, order: nil, sel: nil, showUserLike: nil, unsel: nil, responseJsonDepth: nil, prettyJson: nil, completion:  {(response, error) in
        ACProgressHUD.shared.hideHUD()
        if (error != nil) {
        
        Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
        }
        else{
            if response!["response"] != nil{
            let responsDict = response?["response"] as! NSDictionary
                NSLog("%@", responsDict)
                let photos = responsDict["photos"] as! NSArray
                for photosDict in photos
                {
                    let participentsDict = photosDict as! NSDictionary
                    let nameStr = participentsDict["filename"] as! String
                    let nameId = participentsDict["id"] as! String
                    self.photoNameArr.add(nameStr);
                    self.photoIdArray.add(nameId);
                }
                self.tableView.reloadData()
                }
            else
            {
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
            }
            self.tableView.isHidden=false
            }
        });

    }

}
