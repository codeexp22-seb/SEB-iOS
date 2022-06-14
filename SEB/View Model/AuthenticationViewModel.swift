//
//  AuthenticationViewModel.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    
    @Published var isNotAuthenticated = true
    @Published var authenticationErrorMessage = ""
    @Published var authenticationErrorPresented = false
    
    let auth = Auth.auth()
    
    init() {
        auth.addStateDidChangeListener { auth, user in
            self.isNotAuthenticated = user == nil
        }
        
        isNotAuthenticated = auth.currentUser == nil
    }
    
    func signIn(with email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [self] result, error in
            if let error = error {
                authenticationErrorMessage = error.localizedDescription
                authenticationErrorPresented = true
            }
        }
    }
    
    func signUp(with email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [self] result, error in
            if let error = error {
                authenticationErrorMessage = error.localizedDescription
                authenticationErrorPresented = true
            }
        }
    }
}
