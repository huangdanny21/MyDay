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

    init(with model: Model)
}

extension View where Self: StoryBoardInit & UIViewController {
    static func instantiateFromStoryBoard<T>(withModel model: T) -> Self
    where T == Self.ViewModelType.Model {
        var viewController = Self.makeFromStoryboard()
        viewController.viewModel = ViewModelType(with: model)
        return viewController
    }
    static func instantiateFromNib<T>(withModel model: T, withNibName nibName: String?, withBundle bundle: Bundle?) -> Self
    where T == Self.ViewModelType.Model {
        var viewController = Self.makeFromNib(withNibName: nibName, withBundle: bundle)
        viewController.viewModel = ViewModelType(with: model)
        return viewController
    }
}
