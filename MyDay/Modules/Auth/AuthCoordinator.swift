//
//  AuthCoordinator.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit

final class AuthCoordinator: Coordinate {
    var viewController: AuthViewController?
    
    private lazy var signUpViewController: UIViewController = {
        let coordinator = SignUpCoordinator()
        let vc = SignUpViewController.instantiateFromStoryBoard(withModel: AuthCredentials(), coordinator: coordinator)
        coordinator.viewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }()
    
    private lazy var loginViewController: UIViewController = {
        let coordinator = LoginCoordinator()
        let vc = LoginViewController.instantiateFromStoryBoard(withModel: AuthCredentials(), coordinator: coordinator)
        coordinator.viewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }()
    
    func showScreen(_ screen: AuthCoordinator.Screen) {
        switch screen {
        case .signUp:
            viewController?.present(signUpViewController, animated: true, completion: nil)
        case .login:
            viewController?.present(loginViewController, animated: true, completion: nil)
        }
    }
}

extension AuthCoordinator {
    enum Screen {
        case signUp
        case login
    }
}

