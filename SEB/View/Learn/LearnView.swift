//
//  LearnView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI

struct LearnView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ProgressRingsView()
                CoursesView()
            }
            .navigationTitle("Hi Rui Yang!")
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
