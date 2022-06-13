//
//  CourseCategory.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

enum CourseCategory: String, Codable {
    case skill
    case fitness
    case nationalService
    
    var imageName: String {
        switch self {
        case .skill:
            return "text.book.closed"
        case .fitness:
            return "figure.walk"
        case .nationalService:
            return "shield"
        }
    }
    
    var name: String {
        switch self {
        case .skill:
            return "Skill"
        case .fitness:
            return "Fitness"
        case .nationalService:
            return "NS"
        }
    }
}
