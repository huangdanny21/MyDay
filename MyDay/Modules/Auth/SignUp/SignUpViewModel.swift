//
//  SignUpViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase

class SignUpViewModel: ViewModel {
    typealias Model = AuthCredentials
    let credentials: Model
    private lazy var service: SignUpService = {
        return SignUpServiceProvider()
    }()
    
    // MARK: - Constructor
    
    required init(with model: AuthCredentials) {
        self.credentials = model
    }
    
    // MARK: - Service
    
    func signUp(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return service.createNewUser(withEmail: email, password: password, completion: completion)
    }
}
