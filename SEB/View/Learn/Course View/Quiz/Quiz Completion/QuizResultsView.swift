//
//  QuizResultsView.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import SwiftUI

struct QuizResultsView: View {
    
    @ObservedObject var quizViewModel: QuizViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var lesson: CourseLesson
    var onDismiss: (() -> Void)
    
    var body: some View {
        let passed = quizViewModel.score >= 0.5
        
        VStack {
            Text(lesson.title)
                .font(.system(size: 24, weight: .bold))
            
            Text(passed ? "You passed!" : "You failed.")
                .font(.system(size: 20, weight: .bold))
            
            ZStack {
                CircularProgressView(lineWidth: 30,
                                     progress: quizViewModel.score)
                .frame(width: 200)
                
                Text("\(Int(round(quizViewModel.score * 100)))%")
                    .font(.system(size: 24))
                    .foregroundColor(passed ? Color.accentColor : Color("Red"))
            }
        }
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView(quizViewModel: .init(), lesson: Course.sample.lesson[0]) {
        }
    }
}
