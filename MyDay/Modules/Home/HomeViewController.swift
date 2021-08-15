//
//  HomeViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, StoryBoardInit, View {
    var viewModel: HomeViewModel!
    
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return "HomeViewController" }
    
    @IBAction private func logout(withSender sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            viewModel.coordinator?.showScreen(.auth)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
