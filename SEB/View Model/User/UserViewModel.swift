//
//  UserViewModel.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserViewModel: ObservableObject {
    
    let db: Firestore
    
    var userCourses: [Course] = [.sample]
    
    var suggestedCourses: [Course] {
        return Array(Set(allCourses).subtracting(userCourses))
    }
    
    var allCourses: [Course] = Course.dummy
    
    @Published var user: User?
    
    var rings: Rings {
        get {
            user?.rings ?? .init(skill: 0, fitness: 0, nationalService: 0)
        }
        set {
            user?.rings = newValue
        }
    }
    
    var auth: Auth! {
        didSet {
            loadUserDataFromFirestore()
        }
    }
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadUserDataFromFirestore(username: String? = nil) {
        if let user = auth.currentUser {
            db.collection("users").document(user.uid).getDocument { [self] snapshot, error in
                if let error = error {
                    print(error)
                } else {
                    do {
                        if let user = try snapshot?.data(as: User.self) {
                            withAnimation {
                                self.user = user
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                        
                        if let username = username, !username.isEmpty {
                            self.user = User(name: username,
                                             rewards: [],
                                             rings: .init(skill: 0, fitness: 0, nationalService: 0))
                            
                            try? db.collection("users").document(user.uid).setData(from: self.user)
                        }
                    }
                }
            }
        }
    }
}
