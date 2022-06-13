//
//  Course+Preview.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

extension Course {
    static var sample = Course(title: "Intro to Swift",
                               description: "Potato",
                               categories: [.skill, .nationalService],
                               courseBannerURL: .sampleImage,
                               lesson: [
                                CourseLesson(title: "aaa",
                                             description: "a",
                                             lessonUnit: []),
                                CourseLesson(title: "aaa",
                                             description: "description",
                                             lessonUnit: []),
                                CourseLesson(title: "aaa",
                                             description: "potato",
                                             lessonUnit: [])
                               ],
                               badgeQuiz: [
                                QuizQuestion(title: "Test Question", correctOptionIndex: 1, options: [
                                    UnitRichText(text: "Test", type: .code)
                                ])
                               ])
}
