//
//  Badge+Preview.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation

extension Badge {
    static let sample = Badge(id: .init(),
                              badgeName: "Intro to Swift",
                              badgeDescription: "Learn the basics of iOS development with Apple’s programming language, Swift!",
                              badgeImage: .sampleBadge,
                              date: .now,
                              awardedTo: "2WO Sean Wong",
                              userID: "abc123")
}
