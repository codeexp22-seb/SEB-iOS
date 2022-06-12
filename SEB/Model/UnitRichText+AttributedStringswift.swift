//
//  UnitRichText+AttributedStringswift.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation
import SwiftUI

extension UnitRichText {
    /// Get attributed string from a rich text
    var attributedText: AttributedString {
        let attributedString = AttributedString(text)
        
        switch type {
        case .code:
            return attributedString.settingAttributes(.init([.font: UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize,
                                                                                                weight: .regular)]))
        case .header:
            return attributedString.settingAttributes(.init([.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 1)]))
        case .markdown:
            return (try? AttributedString(markdown: text)) ?? attributedString
        case .plainText:
            return attributedString
        }
    }
}
