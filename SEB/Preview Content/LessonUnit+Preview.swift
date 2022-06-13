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
                                    UnitRichText(text: "https://weknowyourdreams.com%2Fimages%2Fpotato%2Fpotato-07.jpg",
                                                 type: .image)
                                   ],
                                   quiz: [
                                    QuizQuestion(title: "What is a potato", correctOptionIndex: 1, options: [
                                        UnitRichText(text: "A potato", type: .plainText),
                                        UnitRichText(text: "A tomato", type: .plainText),
                                        UnitRichText(text: "A carrot", type: .plainText),
                                        UnitRichText(text: "A deepfried cucumber", type: .plainText)
                                    ])
                                   ])
}
