//
//  DateFormatter.swift
//  MyDay
//
//  Created by Danny Huang on 8/23/21.
//

import Foundation

// MARK: - Mapping For Date
extension DateFormatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter
    }()

    static let hour: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()
}
