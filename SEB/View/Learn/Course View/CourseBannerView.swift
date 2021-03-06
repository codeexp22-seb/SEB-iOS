//
//  CourseBannerView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct CourseBannerView: View {
    
    var bannerURL: URL
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)
                .background(
                    AsyncImage(url: bannerURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.accentColor.opacity(0.1)
                    }
                )
            LinearGradient(colors: [
                Color(.systemBackground).opacity(0),
                Color(.systemBackground)
            ], startPoint: .top, endPoint: .bottom)
            .padding(.horizontal, -8)
        }
        .frame(maxWidth: .infinity)
        .aspectRatio(4.2/2.6, contentMode: .fit)
    }
}

struct CourseBannerView_Previews: PreviewProvider {
    static var previews: some View {
        CourseBannerView(bannerURL: URL(string: "https://tk.sg")!)
    }
}
