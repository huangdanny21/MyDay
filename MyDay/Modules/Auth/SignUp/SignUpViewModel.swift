//
//  SignUpViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase
import GoogleSignIn

final class SignUpViewModel: ViewModel {
    var model: AuthCredentials?
    
    var coordinator: SignUpCoordinator?
    private lazy var service: SignUpService = {
        return SignUpServiceProvider()
    }()
    
    // MARK: - Constructor
    
    init() {
        
    }
    
    // MARK: - Service
    
    func signUp(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return service.createNewUser(withEmail: email, password: password, completion: completion)
    }
    
    func signUpUsingGoogle(withConfiguration configuration: GIDConfiguration, parentVC: UIViewController, completion: @escaping (Result<AuthCredential, SignUpErrors>) -> Void) {
        return service.signUpUsingGoogle(withConfiguration: configuration, parentVC: parentVC, completion: completion)
    }
    
    func addNewUser(withUsername authUser: AuthDataResult) {
        service.addNewUserToDB(with: authUser)
    }
}

