//
//  AppCoordinator.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

final class RootCoordinator: Coordinate {

    weak var viewController: UIViewController?
    weak var window: UIWindow? {
        didSet {
            viewController = window?.rootViewController
        }
    }
    
    private lazy var homeViewController: UIViewController = {
        let coordinator = HomeCoordinator()
        let vc = HomeViewController.instantiateFromStoryBoard(withModel: AuthCredentials(), coordinator: coordinator)
        coordinator.viewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }()
    
    private lazy var authViewController: UIViewController = {
        let coordinator = AuthCoordinator()
        let vc = AuthViewController.instantiateFromStoryBoard(withModel: AuthCredentials(), coordinator: coordinator)
        coordinator.viewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }()
    
    
    private lazy var startUpViewController: UIViewController = {
        let navigationController = UINavigationController(rootViewController: StartUpViewController.makeFromStoryboard())
        return navigationController
    }()

    func showScreen(_ screen: Screen) {
        switch screen {
        case .start:
            window?.rootViewController = startUpViewController
        case .home:
            window?.rootViewController = homeViewController
        case .auth:
            window?.rootViewController = authViewController
        }
    }
}

// MARK: - Define Screens
extension RootCoordinator {
    enum Screen {
        case start
        case home
        case auth
    }
}
