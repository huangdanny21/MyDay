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
          // User is signed in.
            ActivityServiceProvider().retrieveCommonActivities { result in
                switch result {
                case .success(let items):
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            performSegue(withIdentifier: SegueConstant.Auth.toHome, sender: nil)
        } else {
          // No user is signed in.
            performSegue(withIdentifier: SegueConstant.Auth.toAuthentication, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let homeVC = segue.destination as? HomeViewController {
            let coordinator = HomeCoordinator()
            coordinator.viewController = homeVC
            let viewModel = HomeViewModel(withModel: AuthCredentials(), coordinator: coordinator)
            homeVC.viewModel = viewModel
        } else if let authenVC = segue.destination as? AuthViewController {
            let coordinator = AuthCoordinator()
            coordinator.viewController = authenVC
            let viewModel = AuthViewModel(withModel: AuthCredentials(), coordinator: coordinator)
            authenVC.viewModel = viewModel
        } else if let myDayVC = segue.destination as? MyDayViewController {
            let coordinator = MyDayCoordinator()
            coordinator.viewController = myDayVC
            let viewModel = MyDayViewModel(withModel: MyDay(), coordinator: coordinator)
            myDayVC.viewModel = viewModel
        }
    }
}
 
