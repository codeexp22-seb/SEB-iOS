//
//  BadgeQuizHeader.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import SwiftUI

struct BadgeQuizHeader: View {
    
    var courseName: String
    var endDate: Date
    var badgeIcon: URL
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(courseName)
                .font(.system(size: 24, weight: .bold))
            HStack {
                AsyncImage(url: badgeIcon) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "hexagon")
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: 24)
                
                Text("Quiz")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Text(.now.addingTimeInterval(10), style: .timer)
                    .font(.system(size: 20))
            }
        }
        .padding(.horizontal, 21)
    }
}

struct BadgeQuizHeader_Previews: PreviewProvider {
    static var previews: some View {
        BadgeQuizHeader(courseName: "aaa", endDate: .now, badgeIcon: .sampleBadge)
    }
}
