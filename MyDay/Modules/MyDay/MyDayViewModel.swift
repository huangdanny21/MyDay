//
//  MyDayViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase
import UIKit

final class MyDayViewModel: ViewModel {
    var model: MyDay?
    var coordinator: MyDayCoordinator?
    
    private lazy var service: MyDayService = {
        return MyDayServiceProvider()
    }()
    
    // MARK: - Computed
    
    var numOfSections: Int {
        return 1
//        return Activity.allCases.count
    }
    
    // MARK: - consturctor
    
    init() {
        
    }
}
