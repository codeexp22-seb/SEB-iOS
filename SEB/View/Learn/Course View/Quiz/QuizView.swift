//
//  QuizView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct QuizView: View {
    
    var questions: [QuizQuestion]
    
    @State var questionAndAnswers: [QuestionAndAnswers] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Check your understanding")
                    .font(.system(size: 20, weight: .bold))
                
                ForEach($questionAndAnswers) { $questionAndAnswer in
                    let questionIndex = questionAndAnswers.firstIndex(of: questionAndAnswer)!
                    
                    QuizQuestionView(questionIndex: questionIndex,
                                     quizQuestion: questionAndAnswer.question,
                                     selectedIndex: $questionAndAnswer.answer)
                    .padding(.top)
                }
                
                Button {
                    
                } label: {
                    Text("Submit")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
                .padding(.top)

            }
        }
        .onAppear {
            questionAndAnswers = questions.map {
                QuestionAndAnswers(question: $0)
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(questions: [.sample, .sample])
    }
}
