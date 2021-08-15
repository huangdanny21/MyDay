//
//  LoginViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

class LoginViewController: UIViewController, ViewModelBased {
    typealias ViewModelType = LoginViewModel
    var viewModel: LoginViewModel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
}
