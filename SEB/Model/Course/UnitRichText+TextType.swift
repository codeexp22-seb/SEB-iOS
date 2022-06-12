//
//  UnitRichTextType.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

extension UnitRichText {
    enum TextType: String, Codable {
        case header
        case markdown
        case plainText
        case code
        case image
    }
}
