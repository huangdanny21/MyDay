//
//  AuthViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Foundation
import Firebase

final class AuthViewModel: ViewModel {
    var model: AuthCredentials?
    var coordinator: AuthCoordinator?
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    // MARK: - Constructor
    
    init() {
        
    }
}
