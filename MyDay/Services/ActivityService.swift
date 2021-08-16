//
//  ActivityService.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase
import FirebaseFirestore

protocol ActivityService: ServiceProvider {
    func writeNewActivitiesToDB(withData data: [String : [Activity]])
    func retrieveCommonActivities(withCompletion completion: @escaping (Result<ActivityCollection, Error>) -> Void)
}

final class ActivityServiceProvider: ActivityService {
    private let db = Firestore.firestore()
    func writeNewActivitiesToDB(withData data: [String : [Activity]]) {
        do {
            try db.collection("Activities").document("BaseCollection").setData(from: data)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func retrieveCommonActivities(withCompletion completion: @escaping (Result<ActivityCollection, Error>) -> Void) {
        let docRef = db.collection("Activities").document("BaseCollection")
        docRef.getDocument { (document, error) in
            let result = Result {
              try document?.data(as: ActivityCollection.self)
            }
            switch result {
            case .success(let collection):
                if let collection = collection {
                    completion(.success(collection))
                } else {
                    // A nil value was successfully initialized from the DocumentSnapshot,
                    // or the DocumentSnapshot was nil.
                    print("Document does not exist")
                    completion(.failure(ServiceErrors.noData))
                }
            case .failure(let error):
                print("Error decoding city: \(error)")
                completion(.failure(error))
            }
        }
    }
}

struct ActivityCollection: Codable {
    let chores: [Activity]
    let diary: [Activity]
    let food: [Activity]
    let goals: [Activity]
    let health: [Activity]
    let hobbies: [Activity]
    let media: [Activity]
    let sleep: [Activity]
    let social: [Activity]

    enum CodingKeys : String, CodingKey {
        case chores = "Chores"
        case diary = "Diary"
        case food = "Food"
        case goals = "Goals"
        case health = "Health"
        case hobbies = "Hobbies"
        case media = "Media"
        case sleep = "Sleep"
        case social = "Social"
    }
}
