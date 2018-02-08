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

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       queryGeoFence()
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
   
    //Query and delete apis
    
    func queryGeoFence(){
        
        ACProgressHUD.shared.showHUD()
        GeoFencesAPI.geoFencesQuery(page: nil, perPage: nil, limit: nil, skip: nil, responseJsonDepth: nil, where_: nil, prettyJson: nil) { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                // let value = response?.description
                let responseDictionary = response?["response"] as! NSDictionary
                self.listArr = responseDictionary["geo_fences"] as! NSArray
                self.queryTableView.reloadData()
            }
        }
        
    }


    
  
}
