//
//  QuizView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct QuizView: View {
    
    var questions: [QuizQuestion]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Check your understanding")
                    .font(.system(size: 20, weight: .bold))
                
                ForEach(questions) { question in
                    let questionIndex = questions.firstIndex(of: question)!
                    
                    QuizQuestionView(questionIndex: questionIndex, quizQuestion: question)
                }
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(questions: [.sample, .sample])
    }
}
