//
//  QueryPlaceViewController.swift
//  Axway-Test
//
//  Created by Vamshi Sajjana on 12/27/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit


class QueryPlaceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
   
    var placesArr: NSMutableArray = []
    var placeIdArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.separatorStyle = .none
        getPlaces();
        
        
        // Do any additional setup after loading the view.
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
    
    
    func getPlaces()
    {
        ACProgressHUD.shared.showHUD()
        PlacesAPI.placesQuery(page: nil, perPage: nil, limit: nil, skip: nil, where_: nil, order: nil, sel: nil, showUserLike: nil, unsel: nil, responseJsonDepth: nil, prettyJson: true, completion: {(response, error) in
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
