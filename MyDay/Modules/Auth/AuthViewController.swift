//
//  AuthViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

class AuthViewController: UIViewController, StoryBoardInit {
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return "AuthViewController" }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueConstant.Auth.toSignUp, let signUpVC = segue.destination as? SignUpViewController {
            signUpVC.viewModel = SignUpViewModel(with: AuthCredentials())
        } else if segue.identifier == SegueConstant.Auth.toLogin, let loginVC = segue.destination as? LoginViewController {
            loginVC.viewModel = LoginViewModel(with: AuthCredentials())
        }
    }
}

