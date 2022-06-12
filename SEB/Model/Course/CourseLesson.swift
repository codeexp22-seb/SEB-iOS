//
//  CourseLesson.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

struct CourseLesson: Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    
    var lessonUnit: [LessonUnit]
}
