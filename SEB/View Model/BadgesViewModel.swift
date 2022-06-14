//
//  BadgesViewModel.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseDatabaseSwift

class BadgesViewModel: ObservableObject {
    @Published var badges: [Badge] = []
    
    let ref = Database.database().reference()
    
    init() {
        loadBadges()
    }
    
    func loadBadges() {
        ref.child("badges").getData { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let dict = snapshot?.value as? NSDictionary else { return }
            let values = dict.allValues.compactMap { value in
                
                if let dict = value as? NSDictionary,
                   let id = dict["id"] as? String,
                   let uuid = UUID(uuidString: id),
                   let badgeName = dict["badgeName"] as? String,
                   let badgeDescription = dict["badgeDescription"] as? String,
                   let badgeImage = dict["badgeImage"] as? String,
                   let badgeImageURL = URL(string: badgeImage),
                   let badgeDate = dict["date"] as? Double,
                   let awardedTo = dict["awardedTo"] as? String,
                   let userID = dict["userID"] as? String {
                    return Badge(id: uuid,
                          badgeName: badgeName,
                          badgeDescription: badgeDescription,
                          badgeImage: badgeImageURL,
                          date: Date(timeIntervalSince1970: badgeDate),
                          awardedTo: awardedTo,
                          userID: userID)
                } else {
                    return nil
                }
            }
            
            let uid = Auth.auth().currentUser?.uid
            
            let userBadges = values.filter {
                $0.userID == uid
            }
            
            self.badges = userBadges
        }
    }
}
