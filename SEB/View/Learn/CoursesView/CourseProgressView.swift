//
//  CourseProgressView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct CourseProgressView: View {
    
    var progress: Double
    
    var body: some View {
        GeometryReader { context in
            Rectangle()
                .fill(Color.accentColor.opacity(0.3))
                .frame(width: context.size.width)
                .cornerRadius(6)
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: context.size.width * progress)
                .cornerRadius(6)
        }
        .frame(height: 12)
    }
}

struct CourseProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CourseProgressView(progress: 0.5)
    }
}
