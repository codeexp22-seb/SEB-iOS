//
//  CourseView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct CourseView: View {
    
    var completedChapters: Int?
    var course: Course
    
    @State var showBadgeQuiz = false
    
    var body: some View {
        VStack {
            CourseHeaderView(course: course, completedChapters: completedChapters)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(course.lesson) { lesson in
                        CourseLessonRowView(course: course,
                                            lessons: course.lesson,
                                            lesson: lesson,
                                            completedChapters: completedChapters)
                    }
                    
                    Button {
                        showBadgeQuiz = true
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                AsyncImage(url: course.badgeQuizImage) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    Image(systemName: "hexagon")
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(height: 32)
                                
                                Text("Quiz")
                                    .font(.system(size: 24, weight: .bold))
                            }
                            Text("Take a skills assessment after you’ve completed the course!")
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                    .foregroundColor(.black)
                    .fullScreenCover(isPresented: $showBadgeQuiz) {
                        BadgeQuizView(course: course)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: .sample)
    }
}
