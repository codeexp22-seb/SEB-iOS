//
//  CourseView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct CourseView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var course: Course
    
    var body: some View {
        VStack {
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
                    
                    Text("1/\(course.lesson.count) chapters")
                        .multilineTextAlignment(.leading)
                    
                    CourseProgressView(progress: 0.5)
                }
                .padding(.top, .topSafeAreaInset)
                .padding(21)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color(.systemBackground).shadow(color: .black.opacity(0.1), radius: 6))
            .aspectRatio(4.3/2.6, contentMode: .fit)
            
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