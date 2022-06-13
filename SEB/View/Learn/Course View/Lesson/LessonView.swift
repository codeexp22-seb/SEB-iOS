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
        VStack {
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(Color(.label))
            }
            
            UnitView(lesson: courseLesson.lessonUnit[currentUnit])
        }
        
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(courseLesson: .init(title: "", description: "", lessonUnit: [.sample]))
    }
}
