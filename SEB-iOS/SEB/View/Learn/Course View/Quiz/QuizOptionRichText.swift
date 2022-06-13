//
//  QuizOptionRichText.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct QuizOptionRichText: View {
    
    var unitRichText: UnitRichText
    
    var body: some View {
        let attributedString = AttributedString(unitRichText.text)
        
        Group {
            switch unitRichText.type {
            case .code:
                Text(attributedString.settingAttributes(.init([
                    .font: UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize,
                                                       weight: .regular)
                ])))
                .multilineTextAlignment(.leading)
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
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.down.circle")
                                    .padding()
                                Spacer()
                            }
                            Text("Loading image…")
                        }
                    }
                } else {
                    Text(attributedString)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

struct QuizOptionRichText_Previews: PreviewProvider {
    static var previews: some View {
        QuizOptionRichText(unitRichText: .init(text: "hello", type: .code))
    }
}
