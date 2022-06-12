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
    
    var body: some View {
        ZStack {
            AsyncImage(url: course.courseBannerURL) { phase in
                phase.image?
                    .resizable()
                    .scaledToFit()
            }
            
            VStack(alignment: .leading) {
                Text(course.title)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Text(course.description)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
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
