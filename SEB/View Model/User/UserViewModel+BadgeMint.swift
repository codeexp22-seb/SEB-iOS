//
//  UserViewModel+BadgeMint.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

extension UserViewModel {
    func mint(badge: Badge) throws {
        guard let currentUser = auth.currentUser else { return }
        
        let rtdb = Database.database().reference()
        
        try rtdb.child("badges/\(currentUser.uid)").setValue(from: badge)
    }
}
