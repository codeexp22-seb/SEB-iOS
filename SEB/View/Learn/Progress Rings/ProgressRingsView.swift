//
//  ProgressRingsView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation
import SwiftUI

struct ProgressRingsView: View {
    
    var rings: Rings
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Progress")
                .font(.headline)
                .padding(.leading, 21)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ProgressRingView(title: "Skill",
                                     systemName: "text.book.closed",
                                     progress: rings.skill)
                    
                    ProgressRingView(title: "Fitness",
                                     systemName: "figure.walk",
                                     progress: rings.fitness)
                    
                    ProgressRingView(title: "NS",
                                     systemName: "shield",
                                     progress: rings.nationalService)
                }
                .padding(.horizontal, 21)
            }
        }
    }
}

struct ProgressRingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingsView(rings: .init(skill: 0,
                                       fitness: 0,
                                       nationalService: 0))
    }
}
