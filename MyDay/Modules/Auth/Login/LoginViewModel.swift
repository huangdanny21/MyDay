//
//  LoginViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase

final class LoginViewModel: ViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    var model: AuthCredentials?
    
    var coordinator: LoginCoordinator?

    private lazy var service: LoginService = {
        return LoginServiceProvider()
    }()

    // MARK: - Constructor
    
    init() {
        
    }
    
    // MARK: - Service
    
    func login(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return service.login(withEmail: email, password: password, completion: completion)
    }
}
