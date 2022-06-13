//
//  ContentView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LearnView()
                .tabItem {
                    Label("Learn", systemImage: "graduationcap")
                }
            BadgesView()
                .tabItem {
                    Label("Badges", systemImage: "hexagon")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
