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
                               courseBannerURL: URL(string: "https://devimages-cdn.apple.com/wwdc-services/articles/images/79D2FB92-5621-412F-A544-C35938FF1041/2048.jpeg")!,
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
                               ])
}
