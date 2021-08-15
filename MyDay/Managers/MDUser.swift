//
//  MDUser.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase

class MDUser {
    static let shared = MDUser()
    private var handle: Auth?
    
    var user: User? {
        didSet {
            if let user = user {
                print("User is logged in")
            }
        }
    }
    
    // MARK: - Constructor
    
    private init() {
        self.handle = Auth.auth().addStateDidChangeListener { auth, firUser in
            self.user = firUser
        } as? Auth
    }
}
