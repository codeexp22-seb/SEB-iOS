//
//  QuizView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct QuizView: View {
    
    var questions: [QuizQuestion]
    
    @StateObject var quizViewModel = QuizViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isResultsPresented = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Check your understanding")
                    .font(.system(size: 20, weight: .bold))
                
                ForEach($quizViewModel.questionAndAnswers) { $questionAndAnswer in
                    
                    let questionIndex = quizViewModel.index(of: questionAndAnswer)!
                    
                    QuizQuestionView(questionIndex: questionIndex,
                                     quizQuestion: questionAndAnswer.question,
                                     selectedIndex: $questionAndAnswer.answer)
                    .padding(.top)
                }
                
                Button {
                    isResultsPresented = true
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
                .fullScreenCover(isPresented: $isResultsPresented) {
                    QuizResultsView {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .onAppear {
            quizViewModel.questions = questions
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(questions: [.sample, .sample])
    }
}
