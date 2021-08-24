//
//  App.Font.swift
//  MyDay
//
//  Created by Danny Huang on 8/23/21.
//

import UIKit

extension App {
    struct Font {
        enum FontType {
            case demiBold(Double)
            case regular(Double)
        }
        
        enum FontName: String {
            case demiBold = "AvenirNext-DemiBold"
            case regular = "AvenirNext-Regular"
        }
        
        let type: FontType
    }
}

extension App.Font {
    var instance: UIFont {
        let defaultFont = UIFont.systemFont(ofSize: CGFloat(12.0))
        switch type {
        case .demiBold(let size):
            return UIFont(name: App.Font.FontName.demiBold.rawValue, size: CGFloat(size)) ?? defaultFont
        case .regular(let size):
            return UIFont(name: App.Font.FontName.regular.rawValue, size: CGFloat(size)) ?? defaultFont
        }
    }
}
