//
//  HomeCoordinator.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

final class HomeCoordinator: Coordinate {

    weak var viewController: HomeViewController?
    
    private lazy var authViewController: UIViewController = {
        let coordinator = AuthCoordinator()
        let vc = AuthViewController.instantiateFromStoryBoard(coordinator: coordinator)
        coordinator.viewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }()
    
    func showScreen(_ screen: HomeCoordinator.Screen) {
        switch screen {
        case .auth:
            UIApplication.shared.windows.first?.rootViewController = authViewController
        }
    }
}

extension HomeCoordinator {
    enum Screen {
        case auth
    }
}
