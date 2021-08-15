//
//  StartUpViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit
import Firebase

class StartUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
          // User is signed in.
            performSegue(withIdentifier: SegueConstant.Auth.toHome, sender: nil)
        } else {
          // No user is signed in.
            performSegue(withIdentifier: SegueConstant.Auth.toAuthentication, sender: nil)
        }
    }
}
 
