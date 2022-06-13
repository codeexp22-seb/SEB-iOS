//
//  ExploreView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Explore")
                .font(.headline)
                .padding(.leading, 21)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if userViewModel.suggestedCourses.isEmpty {
                VStack(alignment: .center) {
                    Text("No new courses 😔")
                        .bold()
                    Text("Come back again next time.")
                }
                .frame(maxWidth: .infinity)
                .padding()
            } else {
                ForEach(userViewModel.suggestedCourses) { course in
                    CourseCardView(course: course)
                        .aspectRatio(1.7, contentMode: .fit)
                }
                .padding(.horizontal, 21)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(userViewModel: .init())
    }
}
