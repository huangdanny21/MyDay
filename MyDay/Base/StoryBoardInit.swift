//
//  StoryBoardInit.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Foundation

import UIKit

protocol StoryBoardInit {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String? { get }
    
    static func makeFromStoryboard() -> Self
    static func makeFromNib(withNibName nibName: String?, withBundle bundle: Bundle?) -> Self
}

extension StoryBoardInit where Self: UIViewController {
    static var storyboardName: String { return "" }
    static var storyboardBundle: Bundle? { return Bundle.main }
    static var storyboardIdentifier: String? { return nil }

    static func makeFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)

        if let storyboardIdentifier = storyboardIdentifier {
            return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        } else {
            return storyboard.instantiateInitialViewController() as! Self
        }
    }
    
    static func makeFromNib(withNibName nibName: String?, withBundle bundle: Bundle?) -> Self {
        return Self.init(nibName: nibName, bundle: bundle)
    }
}
