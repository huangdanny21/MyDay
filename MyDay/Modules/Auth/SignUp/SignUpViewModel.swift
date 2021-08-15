//
//  SignUpViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Foundation

struct SignUpViewModel: ViewModel {
    typealias Model = AuthCredentials
    let credentials: Model
    private lazy var service: SignUpService = {
        return SignUpServiceProvider()
    }()
    
    // MARK: - Constructor
    
    init(with model: AuthCredentials) {
        self.credentials = model
    }
}
