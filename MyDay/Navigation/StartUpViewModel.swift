//
//  StartUpViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//


import Firebase

final class StartUpViewModel: ViewModel {
    var model: AuthCredentials?
    
    var coordinator: StartUpCoordinator?

    // MARK: - Constructor
    
    init() {
        
    }
}
