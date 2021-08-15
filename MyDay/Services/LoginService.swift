//
//  LoginService.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase

protocol LoginService: ServiceProvider {
    func login(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback)
}

final class LoginServiceProvider: LoginService {
    func login(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}


