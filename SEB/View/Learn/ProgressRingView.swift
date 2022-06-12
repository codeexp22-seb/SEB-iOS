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
    
    @State var animationProgress = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: animationProgress)
                    .frame(width: 100, height: 100)
                
                Image(systemName: systemName)
                    .foregroundColor(.accentColor)
                    .font(.system(size: 32, weight: .bold))
            }
            
            Text(title)
                .font(.caption)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                animationProgress = progress
            }
        }
        .onChange(of: progress) { progress in
            withAnimation(.easeInOut(duration: 1)) {
                animationProgress = progress
            }
        }
    }
}

struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingView(title: "Skill", systemName: "text.book.closed", progress: 0.5)
            
    }
}
