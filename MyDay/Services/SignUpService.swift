//
//  SignUpService.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase

protocol SignUpService: ServiceProvider {
    func createNewUser(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback)
}

final class SignUpServiceProvider: SignUpService {
    func createNewUser(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
}
