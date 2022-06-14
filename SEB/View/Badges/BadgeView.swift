//
//  BadgeView.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import SwiftUI

struct BadgeView: View {
    
    var badge: Badge
    
    @State var isBadgeDetailPresented = false
    
    var body: some View {
        Button {
            isBadgeDetailPresented = true
        } label: {
            VStack {
                AsyncImage(url: badge.badgeImage) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "hexagon")
                        .resizable()
                        .scaledToFit()
                }
                
                Text(badge.badgeName)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
        }
        .sheet(isPresented: $isBadgeDetailPresented) {
            BadgeDetailView(badge: badge)
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(badge: .sample)
            .previewLayout(.sizeThatFits)
    }
}
