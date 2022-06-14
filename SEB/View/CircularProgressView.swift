//
//  CircularProgressView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation
import SwiftUI

struct CircularProgressView: View {
    
    var lineWidth = 15.0
    var accentColor: Color = .accentColor
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .fixedSize(horizontal: false, vertical: false)
                .opacity(0.3)
                .foregroundColor(accentColor)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: lineWidth,
                                     lineCap: .round,
                                     lineJoin: .round))
                .fixedSize(horizontal: false, vertical: false)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 270))
        }
        .padding(lineWidth / 2)
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}
