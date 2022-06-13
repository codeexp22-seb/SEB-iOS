//
//  Course.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

struct Course: Codable, Identifiable {
    var id = UUID()
    
    var title: String
    var description: String
    
    var categories: [CourseCategory]
    
    var courseBannerURL: URL
    
    var lesson: [CourseLesson]
    
    var badgeQuiz: [QuizQuestion]
}
