//
//  Rings.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation

struct Rings: Codable {
    var skill: Double
    var fitness: Double
    var nationalService: Double
    
    enum CodingKeys: String, CodingKey {
        case skill = "skill"
        case fitness = "fitness"
        case nationalService = "ns"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.skill = try container.decode(Double.self, forKey: .skill)
        self.fitness = try container.decode(Double.self, forKey: .fitness)
        self.nationalService = try container.decode(Double.self, forKey: .nationalService)
    }
    
    init(skill: Double, fitness: Double, nationalService: Double) {
        self.skill = skill
        self.fitness = fitness
        self.nationalService = nationalService
    }
}
