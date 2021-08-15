//
//  LoginViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase

final class LoginViewModel: ViewModel {
    var model: AuthCredentials?
    
    var coordinator: LoginCoordinator?

    private lazy var service: LoginService = {
        return LoginServiceProvider()
    }()

    // MARK: - Constructor
    
    init(with model: AuthCredentials = AuthCredentials()) {
        self.model = model
    }
    
    // MARK: - Service
    
    func login(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return service.login(withEmail: email, password: password, completion: completion)
    }
}
