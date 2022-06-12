//
//  CoursesView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Your Courses")
                .font(.headline)
                .padding(.leading, 21)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CourseCardView(course: .sample)
                    CourseCardView(course: .sample)
                    CourseCardView(course: .sample)
                }
                .padding(.horizontal, 21)
                .padding(.vertical, 8)
            }
        }
        .padding(.top)
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
