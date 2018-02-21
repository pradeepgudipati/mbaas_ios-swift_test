
//
//  Utils.swift
//  Axway-Test
//
//  Created by Tejasree Marthy on 11/12/17.
//  Copyright © 2017 Innominds. All rights reserved.
//

import Foundation
import UIKit

public class Utils{
    
   class func showAlertWithOkButton(titleStr:String,messageStr:String,viewController:UIViewController){
        let alert = UIAlertController(title: titleStr, message:messageStr, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
