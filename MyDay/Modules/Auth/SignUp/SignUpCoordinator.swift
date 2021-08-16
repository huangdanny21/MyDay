//
//  SignUpCoordinator.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

final class SignUpCoordinator: Coordinate {

    var viewController: SignUpViewController?
    
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
    
    private lazy var myDayViewController: UIViewController = {
        let coordinator = MyDayCoordinator()
        let vc = MyDayViewController.instantiateFromStoryBoard(withModel: MyDay(), coordinator: coordinator)
        coordinator.viewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }()
    
    func showScreen(_ screen: RootCoordinator.Screen) {
        switch screen {
        case .auth:
            viewController?.navigationController?.popViewController(animated: true)
        case .home:
            UIApplication.shared.windows.first?.rootViewController = homeViewController
        case .start:
            break
        case .day:
            UIApplication.shared.windows.first?.rootViewController = myDayViewController
        }
    }
}
