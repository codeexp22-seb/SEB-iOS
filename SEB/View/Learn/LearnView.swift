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
                ProgressRingsView(rings: userViewModel.rings)
                CoursesView(userViewModel: userViewModel)
                ExploreView(userViewModel: userViewModel)
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
