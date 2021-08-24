//
//  StartUpViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit
import Firebase

class StartUpViewController: UIViewController, StoryBoardInit {
    
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return "StartUpViewController" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: App.SegueConstant.Auth.toHome.rawValue, sender: nil)
        } else {
          // No user is signed in.
            performSegue(withIdentifier: App.SegueConstant.Auth.toAuthentication.rawValue, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let homeVC = segue.destination as? HomeViewController {
            let coordinator = HomeCoordinator()
            coordinator.viewController = homeVC
            let viewModel = HomeViewModel(withCoordinator: coordinator)
            homeVC.viewModel = viewModel
        } else if let authenVC = segue.destination as? AuthViewController {
            let coordinator = AuthCoordinator()
            coordinator.viewController = authenVC
            let viewModel = AuthViewModel(withCoordinator: coordinator)
            authenVC.viewModel = viewModel
        } else if let myDayVC = segue.destination as? MyDayViewController {
            let coordinator = MyDayCoordinator()
            coordinator.viewController = myDayVC
            let viewModel = MyDayViewModel(withCoordinator: coordinator)
            myDayVC.viewModel = viewModel
        }
    }
}
 
