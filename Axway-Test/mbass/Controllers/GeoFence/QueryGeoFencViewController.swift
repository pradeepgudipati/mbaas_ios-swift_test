//
//  QueryGeoFencViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 24/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class QueryGeoFencViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var queryTableView: UITableView!
    var listArr:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        queryGeoFence()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableview Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QueryGeoCell", for: indexPath)
        let listDict = listArr[indexPath.row] as! NSDictionary;
        let payloadDict = listDict["payload"] as! NSDictionary
        cell.textLabel?.text = (payloadDict["name"] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        let listDict = listArr[indexPath.row] as! NSDictionary;
        let createGeoFence = self.storyboard?.instantiateViewController(withIdentifier: "CreateGeoFenceViewController") as! CreateGeoFenceViewController
        createGeoFence.geoDict = listDict 
        self.navigationController?.pushViewController(createGeoFence, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            let listDict = listArr[indexPath.row] as! NSDictionary;
            let geofenceId = listDict["id"] as! String
            let alert = UIAlertController(title: "Delete", message:"Are you sure you want to delete", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:nil))
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alert -> Void in
                
                self.deleteGeoFence(geofenceId: geofenceId)
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }

    //Query and delete apis
    
    func queryGeoFence(){
        
        ACProgressHUD.shared.showHUD()
        GeoFencesAPI.geoFencesQuery(page: nil, perPage: nil, limit: nil, skip: nil, responseJsonDepth: nil, where_: nil, prettyJson: nil) { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                 if response!["response"] != nil{
                let responseDictionary = response?["response"] as! NSDictionary
                self.listArr = responseDictionary["geo_fences"] as! NSArray
                self.queryTableView.reloadData()
                }
                 else
                 {
                    let value = response?.description
                    Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                }
            }
        }
        
    }
    func deleteGeoFence(geofenceId:String)
    {
        ACProgressHUD.shared.showHUD()
        GeoFencesAPI.geoFencesDelete(iD: geofenceId, prettyJson: nil) { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
              self.queryGeoFence()
            }
        }
        
    }

    
  
}
