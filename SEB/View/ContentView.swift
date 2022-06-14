//
//  ContentView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    let auth = Auth.auth()
    
    @StateObject var userViewModel = UserViewModel()
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    @StateObject var badgesViewModel = BadgesViewModel()
    
    var body: some View {
        TabView {
            LearnView(userViewModel: userViewModel)
                .tabItem {
                    Label("Learn", systemImage: "graduationcap")
                }
            BadgesView(badges: badgesViewModel.badges)
                .tabItem {
                    Label("Badges", systemImage: "hexagon")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .fullScreenCover(isPresented: $authenticationViewModel.isNotAuthenticated) {
            SignInView(authenticationViewModel: authenticationViewModel) { name in
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                    userViewModel.loadUserDataFromFirestore(username: name)
                }
            }
        }
        .onAppear {
            userViewModel.auth = auth
            authenticationViewModel.auth = auth
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
