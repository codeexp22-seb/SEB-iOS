//
//  BadgeQuizView.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import SwiftUI

struct BadgeQuizView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var quizViewModel = QuizViewModel()
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(Color(.label))
            }
            .padding(21)
            
            BadgeQuizHeader(courseName: course.title, endDate: .now.addingTimeInterval(40), badgeIcon: course.badgeQuizImage)
            
            ScrollView {
                ForEach($quizViewModel.questionAndAnswers) { $questionAndAnswer in
                    let questionIndex = quizViewModel.index(of: questionAndAnswer)!
                    
                    QuizQuestionView(questionIndex: questionIndex,
                                     quizQuestion: questionAndAnswer.question,
                                     selectedIndex: $questionAndAnswer.answer)
                }
                .padding(.horizontal, 21)
            }
            .onAppear {
                quizViewModel.questions = course.badgeQuiz
            }
        }
    }
}

struct BadgeQuizView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeQuizView(course: .sample)
    }
}
