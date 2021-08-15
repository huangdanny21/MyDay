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
    var activity: Activities { get set }
}

enum Activities: Int, CaseIterable {
    case social
    case hobbies
    case sleep
    case food
    case betterMe
    case chores
    case diary
    case media
}
 
struct Activity: ActivityItem {
    var imageUrl: String
    var title: String
    var activity: Activities
}
