//
//  SignUpService.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase
import GoogleSignIn

enum SignUpErrors: Error {
    case networkError(Error)
    case invalidToken
}

protocol SignUpService: ServiceProvider {
    func createNewUser(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback)
    func signUpUsingGoogle(withConfiguration configuration: GIDConfiguration, parentVC: UIViewController, completion: @escaping (Result<AuthCredential, SignUpErrors>) -> Void)
}

final class SignUpServiceProvider: SignUpService {
    func createNewUser(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signUpUsingGoogle(withConfiguration configuration: GIDConfiguration, parentVC: UIViewController, completion: @escaping (Result<AuthCredential, SignUpErrors>) -> Void) {
        return GIDSignIn.sharedInstance.signIn(with: configuration, presenting: parentVC) { user, error in
            
            if let error = error {
                completion(.failure(SignUpErrors.networkError(error)))
              return
            }

            guard
              let authentication = user?.authentication,
              let idToken = authentication.idToken
            else {
                completion(.failure(.invalidToken))
              return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)

            completion(.success(credential))
          }
    }
}
