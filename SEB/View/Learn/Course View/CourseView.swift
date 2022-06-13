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
    
    var body: some View {
        VStack {
            CourseHeaderView(course: course, completedChapters: completedChapters)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(course.lesson) { lesson in
                        let lessonIndex = course.lesson.firstIndex(of: lesson)!
                        let isCompletedLesson = lessonIndex < completedChapters ?? 0
                        
                        VStack(alignment: .leading) {
                            Text(lesson.title)
                                .font(.system(size: 24, weight: .bold))
                            Text(lesson.description)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundColor(isCompletedLesson ? .white : Color(uiColor: .label))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(isCompletedLesson ? Color.accentColor : Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        let isNextLessonCompleted = (lessonIndex + 1) < completedChapters ?? 0
                        
                        Rectangle()
                            .fill(isNextLessonCompleted ? Color.accentColor : Color(.systemGray6))
                            .frame(width: 8, height: 16)
                            .opacity(0.5)
                    }
                    
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
