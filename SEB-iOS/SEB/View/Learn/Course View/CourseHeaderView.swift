//
//  CourseHeaderView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct CourseHeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var course: Course
    var completedChapters: Int?
    
    var body: some View {
        ZStack {
            CourseBannerView(bannerURL: course.courseBannerURL)
            
            VStack(alignment: .leading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(uiColor: .label))
                        .imageScale(.large)
                }
                
                Spacer()
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(course.categories, id: \.rawValue) { category in
                            Text("\(Image(systemName: category.imageName)) \(category.name)")
                                .foregroundColor(.accentColor)
                                .font(.body.bold())
                                .padding(4)
                                .padding(.horizontal, 4)
                                .background(Color.accentColor.opacity(0.2))
                                .cornerRadius(4)
                        }
                    }
                }
                
                Text(course.title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 24, weight: .bold))
                
                Text(course.description)
                    .multilineTextAlignment(.leading)
                
                Spacer()

                if let completedChapters = completedChapters {
                    Text("\(completedChapters)/\(course.lesson.count) chapters")
                        .multilineTextAlignment(.leading)

                    CourseProgressView(progress: Double(completedChapters) / Double(course.lesson.count))
                } else {
                    Text("\(course.lesson.count) chapters")
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.top, .topSafeAreaInset)
            .padding(21)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.systemBackground).shadow(color: .black.opacity(0.1), radius: 6))
        .aspectRatio(4.3/2.6, contentMode: .fit)
    }
}

struct CourseHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CourseHeaderView(course: .sample)
    }
}
