//
//  RichTextView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation
import SwiftUI

struct RichTextView: View {
    var unitRichText: UnitRichText
    
    var body: some View {
        let attributedString = AttributedString(unitRichText.text)
        
        switch unitRichText.type {
        case .code:
            Text(attributedString.settingAttributes(.init([
                .font: UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize,
                                                   weight: .regular)
            ])))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(uiColor: .systemGray6))
            .cornerRadius(8)
        case .header:
            Text(attributedString.settingAttributes(.init([
                .font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 1)
            ])))
            .multilineTextAlignment(.leading)
        case .markdown:
            Text((try? AttributedString(markdown: unitRichText.text)) ?? attributedString)
                .multilineTextAlignment(.leading)
        case .plainText:
            Text(attributedString)
                .multilineTextAlignment(.leading)
        case .image:
            if let url = URL(string: unitRichText.text) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                } placeholder: {
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.down.circle")
                            .padding()
                        Spacer()
                    }
                }
            } else {
                Text(attributedString)
            }
        }
    }
}
