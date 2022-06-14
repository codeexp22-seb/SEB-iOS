//
//  BadgeResultView.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct BadgeResultSuccessView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var badge: Badge
    
    var onDismiss: (() -> Void)
    
    var body: some View {
        VStack {
            Text("You did it!")
                .font(.system(size: 32, weight: .bold))
            
            AsyncImage(url: badge.badgeImage) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "hexagon")
                    .resizable()
                    .scaledToFit()
            }
            .padding([.top, .horizontal], 64)
            
            Text(badge.badgeName)
                .font(.system(size: 20, weight: .bold))
            
            Text(badge.badgeDescription)
                .font(.system(size: 15, weight: .regular))
                .multilineTextAlignment(.center)
            
            Button {
                UIPasteboard.general.setValue("https://verify.gitsconflict.ml/verify/\(badge.id.uuidString)",
                                              forPasteboardType: UTType.url.identifier)
            } label: {
                HStack(spacing: 0) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.white)
                        .frame(height: 32)
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(Color.accentColor)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        Text("verify.gitsconflict.ml/verify/\(badge.id.uuidString)")
                            .foregroundColor(.black)
                            .frame(height: 32)
                            .padding(8)
                    }
                    .background(Color.accentColor.opacity(0.1))
                }
                .cornerRadius(8)
            }
            .padding()
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
                onDismiss()
            } label: {
                Text("Done")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding(21)
        }
    }
}

struct BadgeResultSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeResultSuccessView(badge: .sample) {}
    }
}
