//
//  ActivityService.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase

protocol ActivityService: ServiceProvider {
    func writeNewActivitiesToDB(withData data: [String : [String]])
    func retrieveCommonActivities(withCompletion completion: @escaping (Result<[ActivityItem], Error>) -> Void)
}

final class ActivityServiceProvider: ActivityService {
    private let ref = Database.database().reference()

    func writeNewActivitiesToDB(withData data: [String : [String]]) {
        ref.child("Activities").setValue(data)
    }
    
    func retrieveCommonActivities(withCompletion completion: @escaping (Result<[ActivityItem], Error>) -> Void) {
        ref.child("Activities").observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? NSDictionary else {
                completion(.failure(ServiceErrors.noData))
                return
            }
            print("-----------------------")
            print(value as Dictionary)
            print("-----------------------")
        } withCancel: { error in
            completion(.failure(error))
        }
    }
}

struct ActivityResponseWrapper: Codable {
    
}
