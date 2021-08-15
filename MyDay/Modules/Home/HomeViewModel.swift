//
//  HomeViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Foundation
import Firebase

final class HomeViewModel: ViewModel {
    var model: AuthCredentials?
    var coordinator: HomeCoordinator?

    // MARK: - Constructor
    
    required init(withModel model: AuthCredentials, coordinator: HomeCoordinator) {
        self.model = model
        self.coordinator = coordinator
    }
}
