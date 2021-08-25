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
import RxSwift
import RxCocoa

class SignUpViewController: ViewController, StoryBoardInit ,View {
    
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return "SignUpViewController" }
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpButon: UIButton!
    @IBOutlet private weak var googleSignUpButton: GIDSignInButton!

    var viewModel: SignUpViewModel!
    
    private lazy var loadingIndicator: NVActivityIndicatorView = {
        return NVActivityIndicatorView(frame: view.frame)
    }()
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        bindViewModel()
    }
    
    override func bindViewModel() {
        let username = usernameTextField.rx.text.filterNil().asDriver(onErrorJustReturn: "")
        let email = emailTextField.rx.text.filterNil().asDriver(onErrorJustReturn: "")
        let password = passwordTextField.rx.text.filterNil().asDriver(onErrorJustReturn: "")
        let emailSignUp = signUpButon.rx.tap.asDriver()
                
        let inputs = SignUpViewModel.Input(username: username, email: email, password: password, emailSignUp: emailSignUp)
        let output = viewModel.transform(input: inputs)
        
        output.signUpActive.drive { isActive in
            if isActive {
                self.signUpButon.setTitleColor(.blue, for: .normal)
            } else {
                self.signUpButon.setTitleColor(.red, for: .normal)
            }
            self.signUpButon.isUserInteractionEnabled = isActive
        } onCompleted: {
            print("SignUpCompleted")
        }.disposed(by: bag)
        
        output.signUpError.drive { error in
            self.viewModel.coordinator?.showError(error)
        }.disposed(by: bag)

        output.signUpResult.drive { result in
            self.viewModel.coordinator?.showScreen(RootCoordinator.Screen.day)
        }.disposed(by: bag)
    }
    
    // MARK: - IBAction
    
    @IBAction private func signUpWithGoogle(withSender sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        viewModel.signUpUsingGoogle(withConfiguration: config, parentVC: self) { result in
            switch result {
            case .success(_):
                //Going to home screen
                self.viewModel.coordinator?.showScreen(RootCoordinator.Screen.home)
                break
            case .failure(let error):
                CDAlertView(title: "Sign up Error", message: error.localizedDescription, type: .notification).show()
            }
        }
    }
}
