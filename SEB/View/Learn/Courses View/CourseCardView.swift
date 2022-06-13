//
//  CourseCardView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI

struct CourseCardView: View {
    
    var chaptersCompleted: Int?
    
    var course: Course
    
    @State var isCoursePresented = false
    
    var body: some View {
        Button {
            isCoursePresented = true
        } label: {
            VStack {
                Rectangle()
                    .stroke(.clear)
                    .background(
                        AsyncImage(url: course.courseBannerURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.accentColor.opacity(0.1)
                        }
                    )
                
                VStack(alignment: .leading) {
                    Text(course.title)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 4) {
                        if let chaptersCompleted = chaptersCompleted {
                            Text("\(chaptersCompleted)/\(course.lesson.count) chapters •")
                                .font(.subheadline)
                        } else {
                            Text("\(course.lesson.count) chapters •")
                                .font(.subheadline)
                        }
                        
                        ForEach(course.categories, id: \.rawValue) { category in
                            Image(systemName: category.imageName)
                                .foregroundColor(.accentColor)
                        }
                    }
                    
                    if let chaptersCompleted = chaptersCompleted {
                        CourseProgressView(progress: Double(chaptersCompleted) / Double(course.lesson.count))
                    } else {
                        Text(course.description)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(8)
            }
        }
        .cornerRadius(8)
        .background(Color(uiColor: .systemBackground).cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 6))
        .fullScreenCover(isPresented: $isCoursePresented) {
            CourseView(course: course)
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CourseCardView(course: .sample)
            .previewLayout(.sizeThatFits)
        
        CourseCardView(chaptersCompleted: 3, course: .sample)
            .previewLayout(.sizeThatFits)
    }
}
