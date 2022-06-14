//
//  QuizView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct QuizView: View {
    
    var course: Course
    var questions: [QuizQuestion]
    var lesson: CourseLesson
    
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
                    QuizResultsView(quizViewModel: quizViewModel, course: course, lesson: lesson) {
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
        QuizView(course: .sample, questions: [.sample, .sample], lesson: Course.sample.lesson[0])
    }
}
