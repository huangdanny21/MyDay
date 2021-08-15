//
//  MyDayViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase

class MyDayViewModel: ViewModel {
    var model: MyDay?
    var coordinator: MyDayCoordinator?
    
    // MARK: - consturctor
    
    required init(with model: MyDay = MyDay()) {
        self.model = model
    }
}
