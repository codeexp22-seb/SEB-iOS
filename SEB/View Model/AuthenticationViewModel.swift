//
//  AuthenticationViewModel.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthenticationViewModel: ObservableObject {
    
    @Published var isNotAuthenticated = false
    @Published var authenticationErrorMessage = ""
    @Published var authenticationErrorPresented = false
    
    var auth: Auth! {
        didSet {
            auth.addStateDidChangeListener { _, user in
                self.isNotAuthenticated = user == nil
            }
            
            isNotAuthenticated = auth.currentUser == nil
        }
    }
    
    init() {
        
    }
    
    func signIn(with email: String, password: String, onCompletion: @escaping (() -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { [self] _, error in
            if let error = error {
                authenticationErrorMessage = error.localizedDescription
                authenticationErrorPresented = true
            } else {
                onCompletion()
            }
        }
    }
    
    func signUp(with email: String, password: String, name: String, onCompletion: @escaping (() -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { [self] result, error in
            if let error = error {
                authenticationErrorMessage = error.localizedDescription
                authenticationErrorPresented = true
            } else if let result = result {
                let user = User(name: name,
                                rewards: [],
                                rings: .init(skill: 0, fitness: 0, nationalService: 0))
                
                let db = Firestore.firestore()
                
                try? db.collection("users").document(result.user.uid).setData(from: user)
                
                onCompletion()
            }
        }
    }
}
