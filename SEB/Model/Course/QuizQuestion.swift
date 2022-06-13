//
//  QuizQuestion.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

struct QuizQuestion: Codable, Equatable {
    var title: String
    var correctOptionIndex: Int
    
    var options: [UnitRichText]
}
