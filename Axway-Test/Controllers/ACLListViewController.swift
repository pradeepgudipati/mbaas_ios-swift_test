//
//  ACLListViewController.swift
//  Axway-Test
//
//  Created by knarasannagari on 9/15/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import UIKit

class ACLListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func createACL(_ sender: Any) {
    
    let aCreateOrUpdateACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateOrUpdateACLViewController") as! CreateOrUpdateACLViewController
    aCreateOrUpdateACLViewController.operationTypeValue = operationType.Create
    self.navigationController?.pushViewController(aCreateOrUpdateACLViewController, animated: true)
  }

  @IBAction func showACL(_ sender: Any) {
    
    
    let aCreateOrUpdateACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateOrUpdateACLViewController") as! CreateOrUpdateACLViewController
    aCreateOrUpdateACLViewController.operationTypeValue = operationType.Show
    self.navigationController?.pushViewController(aCreateOrUpdateACLViewController, animated: true)
  }
  
  
  @IBAction func updateACL(_ sender: Any) {
    
    
    let aCreateOrUpdateACLViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateOrUpdateACLViewController") as! CreateOrUpdateACLViewController
    aCreateOrUpdateACLViewController.operationTypeValue = operationType.Update
    self.navigationController?.pushViewController(aCreateOrUpdateACLViewController, animated: true)
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
