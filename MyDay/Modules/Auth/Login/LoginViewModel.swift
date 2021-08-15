//
//  LoginViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Foundation

final class LoginViewModel: ViewModel {
    typealias Model = AuthCredentials
    let credentials: Model
    private lazy var service: LoginService = {
        return LoginServiceProvider()
    }()

    // MARK: - Constructor
    
    init(with model: AuthCredentials) {
        self.credentials = model
    }
}
