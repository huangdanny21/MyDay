//
//  ActivityService.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase

protocol ActivityService: ServiceProvider {
    func writeNewActivitiesToDB(withData data: [String : [String]])
}

final class ActivityServiceProvider: ActivityService {
    
    private let ref = Database.database().reference()

    func writeNewActivitiesToDB(withData data: [String : [String]]) {
        ref.child("Activities").setValue(data)
    }
}
