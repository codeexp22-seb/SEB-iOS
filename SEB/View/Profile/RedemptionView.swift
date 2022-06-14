//
//  RedemptionView.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import SwiftUI

struct RedemptionView: View {
    
    @State var isScratchHidden = false
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack {
            Text("Scratch your card!")
                .font(.system(size: 24, weight: .bold))
            
            ZStack {
                AsyncImage(url: URL(string: "https://user-images.githubusercontent.com/36725840/173668832-5592c6c2-d5d3-42a4-ae3d-3c2ba07ce342.png")!) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Text("Loading")
                }
                
                ScratchViewUI {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                        withAnimation(.easeOut(duration: 1)) {
                            isScratchHidden = true
                        }
                    }
                    
                }
                .allowsHitTesting(true)
                .opacity(isScratchHidden ? 0 : 0.95)
                .cornerRadius(32)
                .aspectRatio(1, contentMode: .fit)
            }
            .frame(width: 256)
            
            Text("Drag across the card to scratch it!")
                .font(.system(size: 15, weight: .regular))
            
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Spacer()
                    Text("Done")
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(8)
            }
            .padding()
        }
    }
}

struct RedemptionView_Previews: PreviewProvider {
    static var previews: some View {
        RedemptionView()
    }
}
