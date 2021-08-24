//
//  SignUpViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase
import GoogleSignIn

final class SignUpViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    var model: AuthCredentials?
    
    var coordinator: SignUpCoordinator?
    private lazy var service: SignUpService = {
        return SignUpServiceProvider()
    }()
        
    // MARK: - Service
    
    func signUp(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return service.createNewUser(withEmail: email, password: password, completion: completion)
    }
    
    func signUpUsingGoogle(withConfiguration configuration: GIDConfiguration, parentVC: UIViewController, completion: @escaping (Result<AuthCredential, App.ServiceError>) -> Void) {
        return service.signUpUsingGoogle(withConfiguration: configuration, parentVC: parentVC, completion: completion)
    }
}

