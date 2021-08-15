//
//  AuthViewController.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

class AuthViewController: UIViewController, StoryBoardInit, View {
    var viewModel: AuthViewModel!
    
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return "AuthViewController" }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func signUp(withSender sender: UIButton) {
        viewModel.coordinator?.showScreen(.signUp)
    }
    
    @IBAction private func login(withSender sender: UIButton) {
        viewModel.coordinator?.showScreen(.login)
    }
}

