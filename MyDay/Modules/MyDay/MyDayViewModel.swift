//
//  MyDayViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase

class MyDayViewModel: ViewModel {
    typealias Model = MyDay
    private var myDay: MyDay
    required init(with model: MyDay) {
        self.myDay = model
    }
}
