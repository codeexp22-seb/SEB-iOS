//
//  Badge.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation

struct Badge: Codable {
    var badgeName: String
    var badgeDescription: String
    
    var badgeImage: URL
    var date: Date
    
    var awardedTo: String
    var userID: String
}
