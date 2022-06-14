//
//  User.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

struct User: Codable {
    var name: String
    
    var credits: Credit
    
    var rings: Rings
    
    var badges: [String] = []
}
