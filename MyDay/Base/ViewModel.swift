//
//  ViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

protocol ViewModel {
    associatedtype Model
    init(with model: Model)
}

protocol ViewModelBased  {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension ViewModelBased where Self: StoryBoardInit & UIViewController {
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
