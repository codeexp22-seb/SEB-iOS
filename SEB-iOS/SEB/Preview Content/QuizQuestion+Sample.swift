//
//  QuizQuestion+Sample.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import Foundation

extension QuizQuestion {
    static let sample = QuizQuestion(title: "Which of the following creates a `Text` with Potato in it?",
                                     correctOptionIndex: 1, options: [
                                        UnitRichText(text: "Text(Potato)", type: .code),
                                        UnitRichText(text: "`Text(Potato)` a", type: .markdown),
                                        UnitRichText(text: "aaaa", type: .plainText),
                                        UnitRichText(text: URL.sampleImage.absoluteString, type: .image)
                                     ])
}
