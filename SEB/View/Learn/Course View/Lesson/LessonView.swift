//
//  LessonView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct LessonView: View {
    
    @State var currentUnit = 0
    @Environment(\.presentationMode) var presentationMode
    
    var courseLesson: CourseLesson
    
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
            
            Text(courseLesson.title)
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, 21)
            
            if currentUnit == courseLesson.lessonUnit.count {
                QuizView(questions: courseLesson.quiz, lesson: courseLesson)
                    .padding(.horizontal, 21)
            } else {
                UnitView(lesson: courseLesson.lessonUnit[currentUnit])
                    .padding(.horizontal, 21)
            }
            
            HStack {
                Button {
                    currentUnit -= 1
                } label: {
                    Image(systemName: "arrow.backward")
                }
                .disabled(currentUnit == 0)
                
                Spacer()
                
                Text("\(currentUnit + 1) of \(courseLesson.lessonUnit.count + 1)")
                
                Spacer()
                
                Button {
                    currentUnit += 1
                } label: {
                    Image(systemName: "arrow.forward")
                }
                .disabled(currentUnit == courseLesson.lessonUnit.count)
            }
            .font(.system(size: 20, weight: .bold))
            .padding(21)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(courseLesson: .init(title: "", description: "", lessonUnit: [.sample], quiz: [.sample]))
    }
}
