//
//  Coordinate.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Foundation
import UIKit
import SVProgressHUD

protocol Coordinate {
    associatedtype Screen
    associatedtype View: UIViewController

    var viewController: View? { get set }

    func showScreen(_ screen: Screen)
    func showError(_ error: Error)
}

// MARK: - Coordinator
extension Coordinate {
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Ok", message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(ok)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
