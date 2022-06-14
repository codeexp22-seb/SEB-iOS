//
//  ScratchCardView.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import SwiftUI

struct ScratchCardView: View {
    
    var color: String
    var points: Int
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(color + "1"),
                Color(color + "2")
            ], startPoint: .topTrailing, endPoint: .bottomLeading)
            
            VStack {
                Spacer()
                Text(color)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black.opacity(0.3))
                Spacer()
                Text("\(points) Points")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding()
        }
        .cornerRadius(8)
    }
}

struct ScratchCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScratchCardView(color: "Bronze", points: 10)
    }
}
