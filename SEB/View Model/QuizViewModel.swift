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
    
    var correctOptions: Int {
        get {
            questionAndAnswers.reduce(0) { partialResult, qna in
                let questionScore = qna.question.correctOptionIndex == qna.answer ? 1 : 0
                
                return partialResult + questionScore
            }
        }
    }
    
    func index(of value: QuestionAndAnswers) -> Int? {
        return questionAndAnswers.firstIndex(of: value)!
    }
}
