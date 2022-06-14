//
//  Rewards.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation
import FirebaseFirestore

struct Reward: Codable {
    var dateAwarded: Timestamp
    var redeemed: Bool
    var reward: String
}
