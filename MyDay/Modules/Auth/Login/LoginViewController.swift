//
//  LoginViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit
import NVActivityIndicatorView
import CDAlertView

class LoginViewController: UIViewController, View {
    var viewModel: LoginViewModel!
    
    @IBOutlet private weak var emailTextField: UITextField?
    @IBOutlet private weak var passwordTextField: UITextField?
    
    private lazy var loadingIndicator: NVActivityIndicatorView = {
        return NVActivityIndicatorView(frame: view.frame)
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    // MARK: - IBAction
    
    @IBAction private func login(withSender sender: UIButton) {
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

        viewModel.login(withEmail: email, password: password) { result, error in
            if let err = error {
                CDAlertView(title: "Login Error", message: err.localizedDescription, type: .notification).show()
            } else {
                UIApplication.shared.delegate?.goToHomePage()
                print("Log in Succeeded")
            }
        }
    }
}
