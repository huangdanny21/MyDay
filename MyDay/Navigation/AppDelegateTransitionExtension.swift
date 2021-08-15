//
//  AppDelegateTransitionExtension.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

extension UIApplicationDelegate {
    func goToHomePage() {
        let viewController = HomeViewController.makeFromStoryboard()
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func goToAuthentication() {
        let viewController = AuthViewController.makeFromStoryboard()
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}


