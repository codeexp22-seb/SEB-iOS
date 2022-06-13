//
//  LessonUnit.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

struct LessonUnit: Codable, Equatable {
    var title: String
    
    var unitContents: [UnitRichText]
}
