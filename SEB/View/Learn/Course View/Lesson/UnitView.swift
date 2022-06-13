//
//  UnitView.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import SwiftUI

struct UnitView: View {
    
    var lesson: LessonUnit
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(lesson.title)
                    .font(.system(size: 20, weight: .bold))
                
                ForEach(lesson.unitContents, id: \.text) { content in
                    RichTextView(unitRichText: content)
                }
            }
        }
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(lesson: .sample)
    }
}
