//
//  MDUser.swift
//  MyDay
//
//  Created by Danny Huang on 8/14/21.
//

import Firebase

class MDUserManager {
    static let shared = MDUserManager()
    private var handle: Auth?
    
    var user: User? {
        didSet {
            if let _ = user {
                print("User is logged in")
            }
        }
    }
    
    var isLoggedIn: Bool {
        return user != nil
    }
    
    // MARK: - Constructor
    
    private init() {
        self.handle = Auth.auth().addStateDidChangeListener { auth, firUser in
            self.user = firUser
        } as? Auth
    }
}
