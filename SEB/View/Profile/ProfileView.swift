//
//  ProfileView.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    var body: some View {
        Button {
            try? Auth.auth().signOut()
        } label: {
            Text("Sign out")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
