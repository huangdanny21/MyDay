//
//  SignUpViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase
import GoogleSignIn
import RxSwift
import RxCocoa
import CDAlertView

 enum SignUpError: Error {
    case invalidEmail
    case emailEmpty
    case passwordEmpty
    case serviceCallback(String)
}

extension SignUpError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString(
                "Email field is in wrong format",
                comment: "Email field is invalid"
            )
        case .emailEmpty:
            return NSLocalizedString(
                "Email field is empty",
                comment: ""
            )
        case .passwordEmpty:
            return NSLocalizedString(
                "An unexpected error occurred.",
                comment: "Unexpected Error"
            )
        case .serviceCallback(let message):
            return NSLocalizedString(
                "Sign up Error",
                comment: message
            )
        }
    }
}

final class SignUpViewModel: ViewModel {
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

extension SignUpViewModel {
    struct Input {
        let username: Driver<String>
        let email: Driver<String>
        let password: Driver<String>
        let emailSignUp: Driver<Void>
    }
    
    struct Output {
        let validationError: Driver<Error>
        let signUpError: Driver<Error>
        let signUpActive: Driver<Bool>
        let signUpResult: Driver<AuthDataResult>
    }
    
    func transform(input: Input) -> Output {
        let rxError: RxError = RxError()
        let indicator: RxIndicator = RxIndicator()
        let emailAndPassword = Driver.combineLatest(input.email, input.password)

        let buttonActive: Driver<Bool> = emailAndPassword
            .flatMapLatest { email, password -> Driver<Bool> in
                let isActive = !email.isEmpty && !password.isEmpty
                return Driver.just(isActive)
            }
        
        let validationError: Driver<Error> = emailAndPassword
            .flatMapLatest { email, password -> Driver<Error> in
                if email.isEmpty {
                    return Driver.just(SignUpError.emailEmpty)
                } else if password.isEmpty {
                    return Driver.just(SignUpError.passwordEmpty)
                } else {
                    return Driver.empty()
                }
            }
        

        let signUpResult: Driver<AuthDataResult> = emailAndPassword
            .flatMapLatest { email, password -> Driver<AuthDataResult> in
                return self.service.createNewUser(withEmail: email, password: password).indicate(indicator).trackError(into: rxError).emptyDriverIfError()
            }
        
        let error = rxError.asObservable().do(onNext: { (error) in
            self.coordinator?.showError(error)
        }).emptyDriverIfError()

        return Output(validationError: validationError, signUpError: error, signUpActive: buttonActive, signUpResult: signUpResult)
    }
}

