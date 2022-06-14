//
//  BadgesView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI

struct BadgesView: View {
    
    var badges: [Badge]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [.init(.adaptive(minimum: 96), spacing: 32)]) {
                    ForEach(badges) { badge in
                        BadgeView(badge: badge)
                    }
                }
                .padding(21)
            }
            .navigationTitle("Badges")
        }
    }
}

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView(badges: [.sample])
    }
}
