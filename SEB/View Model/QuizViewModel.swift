//
//  QuizViewModel.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var questionAndAnswers: [QuestionAndAnswers] = []
    
    @Published var questions: [QuizQuestion] = [] {
        didSet {
            questionAndAnswers = questions.map {
                QuestionAndAnswers(question: $0)
            }
        }
    }
    
    func index(of value: QuestionAndAnswers) -> Int? {
        return questionAndAnswers.firstIndex(of: value)!
    }
}
