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
        case .header:
            Text(attributedString.settingAttributes(.init([
                .font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 1)
            ])))
        case .markdown:
            Text((try? AttributedString(markdown: unitRichText.text)) ?? attributedString)
        case .plainText:
            Text(attributedString)
        case .image:
            if let url = URL(string: unitRichText.text) {
                AsyncImage(url: url) { phase in
                    return phase.image?.resizable().scaledToFit()
                }
            } else {
                Text(attributedString)
            }
        }
    }
}
