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
    
    init() {
        db = Firestore.firestore()
        loadUserDataFromFirestore()
    }
    
    func loadUserDataFromFirestore() {
        if let user = Auth.auth().currentUser {
            print(user.uid)
            db.collection("users").document(user.uid).getDocument { snapshot, error in
                do {
                    if let user = try snapshot?.data(as: User.self) {
                        withAnimation {
                            self.user = user
                        }
                        
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
