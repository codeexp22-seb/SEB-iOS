//
//  QuestionAndAnswers.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation

struct QuestionAndAnswers: Identifiable, Equatable {
    var id = UUID()
    var question: QuizQuestion
    var answer: Int?
}
