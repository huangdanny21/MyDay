//
//  AppDelegateTransitionExtension.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import UIKit

extension UIApplicationDelegate {
    func goToHomePage() {
        let homeStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func goToAuthentication() {
        let homeStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = homeStoryboard.instantiateViewController(withIdentifier: "AuthViewController")
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}


