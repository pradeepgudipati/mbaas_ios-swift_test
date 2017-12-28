//
//  CreateGeoFenceViewController.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 24/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class CreateGeoFenceViewController: UIViewController {

    @IBOutlet weak var latitudeTxt: UITextField!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var longitudeTxt: UITextField!
    @IBOutlet weak var radiusTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    var geoDict:NSDictionary = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if geoDict.allKeys.count > 0
        {
            createBtn.setTitle("Update", for: UIControlState.normal)
    
            let payloadDict = geoDict["payload"] as! NSDictionary
            let locDict = geoDict["loc"] as! NSDictionary
            let coordinatesArr = locDict["coordinates"] as! NSArray
            
            self.nametxt.text = (payloadDict["name"] as! String)
            if coordinatesArr.count > 0
            {
                let a:Double = coordinatesArr[0] as! Double
                let b:Double = coordinatesArr[1] as! Double
                self.longitudeTxt.text = String(format:"%.2f",a)
                self.latitudeTxt.text = String(format:"%.2f",b)
            }
            self.radiusTxt.text = (locDict["radius"] as! String)
           
        }
        else
        {
           createBtn.setTitle("Create", for: UIControlState.normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createBtnAction(_ sender: Any) {
        
        if nametxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter name", viewController: self)
        }
        else if latitudeTxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter latitude", viewController: self)
        }
        else if longitudeTxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter longitude", viewController: self)
        }
        else if radiusTxt.text!.characters.count == 0
        {
            Utils.showAlertWithOkButton(titleStr: "Alert", messageStr: "Please enter radius", viewController: self)
        }
        else
        {
            createGeoFenceDict()
            
        }
        
    }
    
    func createGeoFenceDict(){
        let coordinatesArr:NSMutableArray = []
        let longVal = Double(longitudeTxt.text!)
        let latVal =  Double(latitudeTxt.text!)
        

        coordinatesArr.add(longVal as Any)
        coordinatesArr.add(latVal as Any)
        
        let cordinateDict:NSMutableDictionary = [:]
        cordinateDict.setValue(coordinatesArr, forKey: "coordinates")
        cordinateDict.setValue(radiusTxt.text, forKey: "radius")
       
        let nameDict:NSMutableDictionary = [:]
        nameDict.setValue(nametxt.text, forKey: "name")
       
        let geofenceDict:NSMutableDictionary = [:]
        geofenceDict.setValue(nameDict, forKey:"payload")
        geofenceDict.setValue(cordinateDict, forKey:"loc")
        
        print(geofenceDict)
    
        do {

            let data = try JSONSerialization.data(withJSONObject: geofenceDict, options: .init(rawValue: 0)) as Data
            
            let jsonStr = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            print(jsonStr as Any)
            
            if geoDict.allKeys.count == 0
            {
                self.createGeoFenceApi(jsonStr: jsonStr! as String)
            }
            else
            {
                self.updateGeoFenceApi(jsonStr: jsonStr! as String)
            }
            
            
        } catch {
            print("Error")
        }
        
    }
    
    func createGeoFenceApi(jsonStr:String)
    {
    
        ACProgressHUD.shared.showHUD()
        GeoFencesAPI.geoFencesCreate(geoFence:jsonStr as String , completion: { (response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                
            }
            
        })
    }
    
    func updateGeoFenceApi(jsonStr:String)
    {
        
        ACProgressHUD.shared.showHUD()
        
        GeoFencesAPI.geoFencesUpdate(iD: geoDict["id"] as! String, geoFence: jsonStr as String, prettyJson: nil) { (response, error) in
            
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
                
            }
            else {
                
                let value = response?.description
                Utils.showAlertWithOkButton(titleStr:"Alert" , messageStr: value!, viewController: self)
                
            }
        }
        
    }
    
}
