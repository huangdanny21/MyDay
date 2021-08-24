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
