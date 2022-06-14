//
//  BadgeQuizView.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import SwiftUI
import FirebaseAuth

struct BadgeQuizView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var quizViewModel = QuizViewModel()
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var isResultsPresented = false
    @State var badge: Badge?
    
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
            
            Button {
                badge = Badge(id: .init(),
                              badgeName: course.title,
                              badgeDescription: course.description,
                              badgeImage: course.badgeQuizImage,
                              date: .now,
                              awardedTo: userViewModel.user!.name,
                              userID: userViewModel.auth.currentUser!.uid)
                
                isResultsPresented = true
                
                try? userViewModel.mint(badge: badge!)
                
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
            .fullScreenCover(item: $badge) { badge in
                BadgeResultSuccessView(badge: badge) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding(21)
        }
    }
}

struct BadgeQuizView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeQuizView(course: .sample)
    }
}
