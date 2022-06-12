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
                               courseBannerURL: URL(string: "https://tinkercademy.com/wp-content/uploads/2019/05/IMG_8168.jpg")!,
                               lesson: [
                                CourseLesson(title: "aaa",
                                             description: "",
                                             lessonUnit: []),
                                CourseLesson(title: "aaa",
                                             description: "",
                                             lessonUnit: []),
                                CourseLesson(title: "aaa",
                                             description: "",
                                             lessonUnit: [])
                               ])
}
