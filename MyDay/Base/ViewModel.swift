//
//  ViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

protocol BaseModel {
    
}

protocol View {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

protocol ViewModel {
    associatedtype Model: BaseModel
    associatedtype CoordinatorType: Coordinate
    var model: Model? { get set }
    var coordinator: CoordinatorType? { get set }
    init()
    init(withModel model: Model, coordinator: CoordinatorType)
}

extension ViewModel {
    init(withModel model: Model, coordinator: CoordinatorType) {
        self.init()
        self.model = model
        self.coordinator = coordinator
    }
}

extension View where Self: StoryBoardInit & UIViewController {
    static func instantiateFromStoryBoard<T, C>(withModel model: T, coordinator: C) -> Self
    where T == Self.ViewModelType.Model, C == Self.ViewModelType.CoordinatorType {
        var viewController = Self.makeFromStoryboard()
        viewController.viewModel = ViewModelType(withModel: model, coordinator: coordinator)
        return viewController
    }
    static func instantiateFromNib<T, C>(withModel model: T, coordinator: C, withNibName nibName: String?, withBundle bundle: Bundle?) -> Self
    where T == Self.ViewModelType.Model, C == Self.ViewModelType.CoordinatorType {
        var viewController = Self.makeFromNib(withNibName: nibName, withBundle: bundle)
        viewController.viewModel = ViewModelType(withModel: model, coordinator: coordinator)
        return viewController
    }
}
