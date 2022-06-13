//
//  ExploreView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Explore")
                .font(.headline)
                .padding(.leading, 21)
            
            ForEach(0..<10) { _ in
                CourseCardView(course: .sample)
                    .aspectRatio(1.7, contentMode: .fit)
            }
            .padding(.horizontal, 21)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
