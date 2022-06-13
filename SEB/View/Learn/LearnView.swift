//
//  LearnView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI

struct LearnView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ProgressRingsView(userViewModel: userViewModel)
                CoursesView()
                ExploreView()
            }
            .navigationTitle("Hi Rui Yang!")
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(userViewModel: .init())
    }
}
