//
//  HomeViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    @IBAction private func logout(withSender sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            UIApplication.shared.delegate?.goToAuthentication()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
