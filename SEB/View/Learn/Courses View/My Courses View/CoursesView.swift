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
                    ForEach(0..<10) { _ in
                        CourseCardView(chaptersCompleted: 2, course: .sample)
                            .frame(width: 300, height: 230)
                    }
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
