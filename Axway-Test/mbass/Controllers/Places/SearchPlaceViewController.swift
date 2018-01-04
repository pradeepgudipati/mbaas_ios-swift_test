//
//  QueryPlaceViewController.swift
//  Axway-Test
//
//  Created by Vamshi Sajjana on 12/27/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit
import CoreLocation

class SearchPlaceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var placesArr: NSMutableArray = []
    var placeIdArray: NSMutableArray = []
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var  latitude : Double = 0
    var  longitude : Double = 0

    @IBOutlet weak var placeNameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.separatorStyle = .none
        locationManager.requestWhenInUseAuthorization()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            currentLocation = locationManager.location
            if currentLocation != nil
            {
            latitude =   Double(round(1000*currentLocation.coordinate.latitude)/1000)
            longitude = Double(round(1000*currentLocation.coordinate.longitude)/1000)
            getPlacesFromLocation()
            }
            else
            {
                Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Error in current location", viewController: self)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return placesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        
            cell!.textLabel?.text = placesArr[indexPath.row] as? String
        return cell!
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.contentInset = UIEdgeInsetsMake(0,0,55,0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let updateorDeletePlaceViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateorDeletePlaceViewController") as! UpdateorDeletePlaceViewController
        updateorDeletePlaceViewController.place = self.placesArr[indexPath.row] as! NSString
        updateorDeletePlaceViewController.id = self.placeIdArray[indexPath.row] as! NSString
        self.navigationController?.pushViewController(updateorDeletePlaceViewController, animated: true)
    }
    
    
    func getPlacesFromLocation()
    {
        ACProgressHUD.shared.showHUD()
        
         PlacesAPI.placesSearch(page: nil, perPage: nil, responseJsonDepth: nil, latitude: nil, longitude: nil, distance: nil, q: placeNameTxt.text, prettyJson: true, completion: {(response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else{
                if response!["response"] != nil{
                    let responsDict = response?["response"] as! NSDictionary
                    let names = responsDict["places"] as! NSArray
                    for partcpntsDict in names
                    {
                        let participentsDict = partcpntsDict as! NSDictionary
                        let nameStr = participentsDict["name"] as! String
                        let nameId = participentsDict["id"] as! String
                        self.placesArr.add(nameStr);
                        self.placeIdArray.add(nameId);
                        }
                    self.tableView.reloadData()
                    }
                else
                {
                    let value = response?.description
                    Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                }
                }
        });
           
    }
    
 
    
}
