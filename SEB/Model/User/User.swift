//
//  User.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

struct User: Codable {
    var name: String
    
    var rewards: [Reward]
    
    var rings: Rings
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.rewards = try container.decode([Reward].self, forKey: .rewards)
//        let rings = try container.decode([String: Double].self, forKey: .rings)
//
//        self.rings = Rings(skill: rings["skill"] ?? 0, fitness: rings["fitness"] ?? 0, nationalService: rings["ns"] ?? 0)
//    }
}
