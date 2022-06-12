//
//  ProgressRingView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI

struct ProgressRingView: View {
    
    var title: String
    var systemName: String
    
    var progress: Double
    
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: progress)
                    .frame(width: 100, height: 100)
                
                Image(systemName: systemName)
                    .foregroundColor(.accentColor)
                    .font(.system(size: 32, weight: .bold))
            }
            
            Text(title)
                .font(.caption)
        }
    }
}

struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingView(title: "Skill", systemName: "text.book.closed", progress: 0.5)
            
    }
}
