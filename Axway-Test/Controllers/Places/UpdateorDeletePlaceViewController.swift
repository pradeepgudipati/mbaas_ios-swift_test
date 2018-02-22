//
//  QueryPlaceViewController.swift
//  Axway-Test
//
//  Created by Vamshi Sajjana on 12/27/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit


class UpdateorDeletePlaceViewController: UIViewController{
    
    @IBOutlet weak var placeLbl: UILabel!
    var place: NSString = ""
    var id: NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeLbl.text = self.place as String
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func updatePlace(_ sender: Any) {
        let aCreatePlaceViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreatePlaceViewController") as! CreatePlaceViewController
        aCreatePlaceViewController.operationTypeValue = updationType.Update
        aCreatePlaceViewController.placeId = self.id
        self.navigationController?.pushViewController(aCreatePlaceViewController, animated: true)
    }
    @IBAction func deletePlace(_ sender: Any) {
        ACProgressHUD.shared.showHUD()
        PlacesAPI.placesDelete(placeId: self.id as String, suId: nil, prettyJson: true, completion: {(response, error) in
            ACProgressHUD.shared.hideHUD()
            if (error != nil) {
                Utils.showAlertWithOkButton(titleStr:"Error" , messageStr: (error?.localizedDescription)!, viewController: self)
            }
            else{
                let value = response?.description
                let alert = UIAlertController(title: "Delete Place Success", message:value, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction!) -> Void in
                    for vc in (self.navigationController?.viewControllers ?? []) {
                        if vc is APIListViewController {
                            _ = self.navigationController?.popToViewController(vc, animated: true)
                            break
                        }
                    }
                }))
                self.present(alert, animated: true, completion:nil)
            }
        });
    }
}
