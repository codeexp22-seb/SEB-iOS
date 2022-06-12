//
//  ProgressRingsView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation
import SwiftUI

struct ProgressRingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Progress")
                .font(.headline)
                .padding(.leading, 21)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ProgressRingView(title: "Skill",
                                     systemName: "text.book.closed",
                                     progress: 1)
                    
                    ProgressRingView(title: "Fitness",
                                     systemName: "figure.walk",
                                     progress: 0.5)
                    
                    ProgressRingView(title: "NS",
                                     systemName: "shield",
                                     progress: 1)
                    
                    ProgressRingView(title: "Badge",
                                     systemName: "hexagon",
                                     progress: 1)
                }
                .padding(.horizontal, 21)
            }
        }
    }
}

struct ProgressRingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingsView()
    }
}
