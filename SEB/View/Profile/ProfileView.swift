//
//  ProfileView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    @State var isRedeptionPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Platoon 1")
                        .font(.system(size: 15, weight: .regular))
                    Text(userViewModel.user?.name ?? "")
                        .font(.system(size: 24, weight: .bold))
                    Text(userViewModel.auth?.currentUser?.email ?? "")
                        .font(.system(size: 20, weight: .medium))
                        .opacity(0.6)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Points Remaining")
                        .font(.system(size: 15, weight: .regular))
                    Text("\(userViewModel.user?.credits.remaining ?? 0)")
                        .font(.system(size: 24, weight: .bold))
                    Text("Use your points to purchase scratch cards to win attractive prizes.")
                        .padding(.top)
                        .font(.system(size: 12))
                    
                    HStack {
                        Button {
                            userViewModel.user?.credits.remaining -= 100
                            isRedeptionPresented = true
                        } label: {
                            ScratchCardView(color: "Bronze", points: 100)
                        }
                        
                        Button {
                            userViewModel.user?.credits.remaining -= 200
                            isRedeptionPresented = true
                        } label: {
                            ScratchCardView(color: "Silver", points: 200)
                        }
                        
                        Button {
                            userViewModel.user?.credits.remaining -= 400
                            isRedeptionPresented = true
                        } label: {
                            ScratchCardView(color: "Gold", points: 400)
                        }
                    }
                    .fullScreenCover(isPresented: $isRedeptionPresented) {
                        RedemptionView()
                    }
                    .frame(height: 128)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button {
                    try? Auth.auth().signOut()
                } label: {
                    HStack {
                        Spacer()
                        Text("Log Out")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color("Red"))
                    .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userViewModel: .init())
    }
}
