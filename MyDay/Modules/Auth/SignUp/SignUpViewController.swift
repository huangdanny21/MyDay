//
//  SignUpViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

class SignUpViewController: UIViewController, ViewModelBased {
    typealias ViewModelType = SignUpViewModel
    var viewModel: SignUpViewModel!
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
    }
}
