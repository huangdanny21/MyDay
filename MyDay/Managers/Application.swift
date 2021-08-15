//
//  Application.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Foundation

import UIKit

final class Application {
    static let current = Application()
    var coodinator: RootCoordinator?

    private init() {}

    func root(in window: UIWindow?) {
        let coodinator = RootCoordinator()
        coodinator.window = window
        let start = MDUser.shared.isLoggedIn ? RootCoordinator.Screen.home : RootCoordinator.Screen.auth
        coodinator.showScreen(start)
    }
}
