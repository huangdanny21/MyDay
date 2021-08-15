//
//  MyDayViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase

class MyDayViewModel: ViewModel {
    typealias Model = MyDay
    private let myDay: MyDay
    
    // MARK: - consturctor
    
    required init(with model: MyDay = MyDay()) {
        self.myDay = model
    }
}
