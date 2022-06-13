//
//  CourseView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct CourseView: View {
    
    var course: Course
    
    var body: some View {
        VStack {
            CourseHeaderView(course: course)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(course.lesson) { lesson in
                        VStack(alignment: .leading) {
                            Text(lesson.title)
                                .font(.system(size: 24, weight: .bold))
                            Text(lesson.description)
                                .font(.system(size: 15, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color(.systemGray6).opacity(0.5))
                            .frame(width: 8, height: 16)
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
