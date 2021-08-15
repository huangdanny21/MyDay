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
    
    private lazy var homeViewController: HomeViewController = {
        var homeVC = HomeViewController.makeFromStoryboard()
        let coordinator = HomeCoordinator()
        homeVC.viewModel = HomeViewModel()
        coordinator.viewController = homeVC
        return homeVC
    }()
    
    private lazy var authViewController: AuthViewController = {
        var authVC = AuthViewController.makeFromStoryboard()
        let coordinator = AuthCoordinator()
        authVC.viewModel = AuthViewModel()
        coordinator.viewController = authVC
        return authVC
    }()

    func showScreen(_ screen: Screen) {
        switch screen {
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
        case home
        case auth
    }
}
