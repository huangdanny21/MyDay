//
//  SignUpViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit
import NVActivityIndicatorView
import CDAlertView
import GoogleSignIn
import Firebase

class SignUpViewController: UIViewController, StoryBoardInit ,View {
    
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return "SignUpViewController" }
    
    
    @IBOutlet private weak var usernameTextField: UITextField?
    @IBOutlet private weak var emailTextField: UITextField?
    @IBOutlet private weak var passwordTextField: UITextField?
    @IBOutlet private weak var googleLoginButton: GIDSignInButton?

    var viewModel: SignUpViewModel!
    
    private lazy var loadingIndicator: NVActivityIndicatorView = {
        return NVActivityIndicatorView(frame: view.frame)
    }()
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
    }
    
    // MARK: - IBAction
    
    @IBAction private func signUp(withSender sender: UIButton) {
        guard let email = emailTextField?.text, !email.isEmpty else {
            CDAlertView(title: "Email field is empty", message: nil, type: .notification).show()
            return
        }
        guard email.isEmail else { CDAlertView(title: "Email Format is wrong", message: nil, type: .notification).show()
            return
        }
        guard let password = passwordTextField?.text, !password.isEmail else {
            CDAlertView(title: "Password field is empty", message: nil, type: .notification).show()
            return
        }
        guard password.isValidPassword else {
            CDAlertView(title: "Password Format is wrong", message: nil, type: .notification).show()
            return
        }
        loadingIndicator.startAnimating()
        viewModel.signUp(withEmail: email, password: password) { result, error in
            self.loadingIndicator.stopAnimating()
            if let err = error {
                CDAlertView(title: "Sign up Error", message: err.localizedDescription, type: .notification).show()
            } else {
                print("Sign Up Succeeded")
                self.viewModel.addNewUser(withUser: result!, displayName: self.usernameTextField?.text ?? "")
                self.viewModel.coordinator?.showScreen(RootCoordinator.Screen.home)
            }
        }
    }
    
    @IBAction private func signUpWithGoogle(withSender sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        viewModel.signUpUsingGoogle(withConfiguration: config, parentVC: self) { result in
            switch result {
            case .success(let credentials):
                //Going to home screen
                self.viewModel.coordinator?.showScreen(RootCoordinator.Screen.home)
                break
            case .failure(let error):
                CDAlertView(title: "Sign up Error", message: error.localizedDescription, type: .notification).show()
            }
        }
    }
}
