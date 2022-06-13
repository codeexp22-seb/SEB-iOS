//
//  CourseLessonRowView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct CourseLessonRowView: View {
    
    var lessons: [CourseLesson]
    var lesson: CourseLesson
    var completedChapters: Int?
    
    @State var isLessonPresented = false
    
    var body: some View {
        VStack(spacing: 0) {
            let lessonIndex = lessons.firstIndex(of: lesson)!
            let isCompletedLesson = lessonIndex < completedChapters ?? 0
            
            Button {
                isLessonPresented = true
            } label: {
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
            }
            .padding(.horizontal)
            
            let isNextLessonCompleted = (lessonIndex + 1) < completedChapters ?? 0
            
            Rectangle()
                .fill(isNextLessonCompleted ? Color.accentColor : Color(.systemGray6))
                .frame(width: 8, height: 16)
                .opacity(0.5)
        }
        .fullScreenCover(isPresented: $isLessonPresented) {
            LessonView(courseLesson: lesson)
        }
    }
}

struct CourseLessonRowView_Previews: PreviewProvider {
    static var previews: some View {
        CourseLessonRowView(lessons: [], lesson: Course.sample.lesson[0])
    }
}
