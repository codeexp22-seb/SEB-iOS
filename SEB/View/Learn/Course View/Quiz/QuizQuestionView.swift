//
//  QuizQuestionView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct QuizQuestionView: View {
    
    var questionIndex: Int
    var quizQuestion: QuizQuestion
    
    @Binding var selectedIndex: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Question \(questionIndex + 1):")
                .font(.system(size: 15, weight: .bold))
            
            Text(quizQuestion.title)
                .multilineTextAlignment(.leading)
                        
            ForEach(quizQuestion.options, id: \.text) { option in
                Button {
                    selectedIndex = quizQuestion.options.firstIndex(of: option)
                } label: {
                    QuizOptionRichText(isSelected: selectedIndex == quizQuestion.options.firstIndex(of: option),
                                       unitRichText: option)
                }
            }
        }
    }
}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView(questionIndex: 1,
                         quizQuestion: QuizQuestion(title: "Which of the following creates a `Text` with Potato in it?",
                                                    correctOptionIndex: 1, options: [
                                                        UnitRichText(text: "Text(Potato)", type: .code),
                                                        UnitRichText(text: "`Text(Potato)` a", type: .markdown),
                                                        UnitRichText(text: "aaaa", type: .plainText),
                                                        UnitRichText(text: URL.sampleImage.absoluteString, type: .image)
                                                    ]), selectedIndex: .constant(nil))
    }
}
