//
//  ViewModel.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

protocol View {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

protocol ViewModel {
    associatedtype CoordinatorType: Coordinate
    var coordinator: CoordinatorType? { get set }
    init()
    init(withCoordinator coordinator: CoordinatorType)
}

extension ViewModel {
    init(withCoordinator coordinator: CoordinatorType) {
        self.init()
        self.coordinator = coordinator
    }
}

extension View where Self: StoryBoardInit & UIViewController {
    static func instantiateFromStoryBoard<C>(coordinator: C) -> Self
    where C == Self.ViewModelType.CoordinatorType {
        var viewController = Self.makeFromStoryboard()
        viewController.viewModel = ViewModelType(withCoordinator: coordinator)
        return viewController
    }
    static func instantiateFromNib<C>(coordinator: C, withNibName nibName: String?, withBundle bundle: Bundle?) -> Self
    where C == Self.ViewModelType.CoordinatorType {
        var viewController = Self.makeFromNib(withNibName: nibName, withBundle: bundle)
        viewController.viewModel = ViewModelType(withCoordinator: coordinator)
        return viewController
    }
}
