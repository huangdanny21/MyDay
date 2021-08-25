//
//  SignUpService.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase
import GoogleSignIn
import FirebaseFirestoreSwift
import RxFirebase
import RxSwift
import RxCocoa

protocol SignUpService: ServiceProvider {
    func createNewUser(withEmail email: String, password: String) -> Single<AuthDataResult>
    func createNewUser(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback)
    func signUpUsingGoogle(withConfiguration configuration: GIDConfiguration, parentVC: UIViewController, completion: @escaping (Result<AuthCredential, App.ServiceError>) -> Void)
}

final class SignUpServiceProvider: SignUpService {
    func createNewUser(withEmail email: String, password: String) -> Single<AuthDataResult> {
        let auth = Auth.auth()
            
        // Create a password-based account
        return auth.rx.createUser(withEmail: "xxx@xxx.com", password: "1q2w3e4r").asSingle()
    }
    
    func createNewUser(withEmail email: String, password: String, completion: @escaping AuthDataResultCallback) {
        return Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signUpUsingGoogle(withConfiguration configuration: GIDConfiguration, parentVC: UIViewController, completion: @escaping (Result<AuthCredential, App.ServiceError>) -> Void) {
        return GIDSignIn.sharedInstance.signIn(with: configuration, presenting: parentVC) { user, error in
            
            if let error = error {
                completion(.failure(.networkError(error)))
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
