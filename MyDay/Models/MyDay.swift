//
//  MyDay.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Foundation

enum MoodLevel {
    case happy
    case sad
    case neutural
    case none
}

class MyDay {
    var numberRatings = 0
    var moodLevel = MoodLevel.none
    var didCompleteTodaysTask = false
    var whatCanIDoBetterText: String?
    var whatIDidToday: String?
    var date: Date?
}
