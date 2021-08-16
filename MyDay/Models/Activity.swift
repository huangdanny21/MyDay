//
//  Activity.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import UIKit
 
protocol ActivityItem {
    var imageUrl: String {get set}
    var title: String { get set }
}

enum Activities: Int, CaseIterable {
    case social
    case hobbies
    case sleep
    case food
    case health
    case betterMe
    case chores
    case diary
    case media
    
    var title: String {
        switch self {
        case .social:
            return "Social"
        case .hobbies:
            return "Hobbies"
        case .sleep:
            return "Sleep"
        case .food:
            return "Food"
        case .betterMe:
            return "Goals"
        case .chores:
            return "Chores"
        case .diary:
            return "Diary"
        case .media:
            return "Media"
        case .health:
            return "Health"
        }
    }
}
 
struct Activity: Codable, ActivityItem {
    var imageUrl: String
    var title: String
}
