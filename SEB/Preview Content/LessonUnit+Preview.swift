//
//  LessonUnit+Preview.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import Foundation

extension LessonUnit {
    static let sample = LessonUnit(title: "Potatoes are great",
                                   unitContents: [
                                    UnitRichText(text: "**Hello** I am a potato", type: .markdown),
                                    UnitRichText(text: "I love potatoes", type: .markdown),
                                    UnitRichText(text: "let x = true\n// i am an elite hacker", type: .code),
                                    UnitRichText(text: URL.sampleImage.absoluteString,
                                                 type: .image)
                                   ])
}
