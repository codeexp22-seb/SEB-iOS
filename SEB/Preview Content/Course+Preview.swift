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
                                             lessonUnit: [.sample, .sample, .sample],
                                             quiz: [.sample, .sample, .sample]),
                                CourseLesson(title: "aaa",
                                             description: "description",
                                             lessonUnit: [.sample, .sample, .sample],
                                             quiz: [.sample, .sample, .sample]),
                                CourseLesson(title: "aaa",
                                             description: "potato",
                                             lessonUnit: [.sample, .sample, .sample],
                                             quiz: [.sample, .sample, .sample])
                               ],
                               badgeQuiz: [
                                QuizQuestion(title: "Test Question", correctOptionIndex: 1, options: [
                                    UnitRichText(text: "Test", type: .code)
                                ])
                               ],
                               badgeQuizImage: URL(string: "https://user-images.githubusercontent.com/36725840/173285564-e8f87735-616a-4b42-8cd3-f6fe6ac9a435.png")!)
}
