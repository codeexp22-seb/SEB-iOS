//
//  SignInView.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @State var name = ""
    
    @State var rotation = Angle.zero
    @State var scale = 1.0
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var onDismiss: ((String) -> ())
    
    @State var isSignIn = true
    @State var presentAdditionalOptions = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Text("Welcome to")
                    .font(.system(size: 24))
                
                Text("SEB")
                    .font(.system(size: 32, weight: .bold))
                    .rotation3DEffect(rotation, axis: (1.25, 1, 1.1))
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: false)) {
                            rotation = .degrees(360)
                        }
                        withAnimation(.easeInOut(duration: 0.1).repeatForever()) {
                            scale = 1.3
                        }
                    }
            }
            
            Picker("", selection: $isSignIn) {
                Text("Sign In")
                    .tag(true)
                Text("Sign Up")
                    .tag(false)
            }
            .pickerStyle(.segmented)
            .onChange(of: isSignIn) { newValue in
                withAnimation {
                    presentAdditionalOptions = !newValue
                }
            }
            
            if presentAdditionalOptions {
                TextField("Name", text: $name)
                    .padding(.bottom)
            }
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .padding(.bottom)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $password)
                .padding(.bottom)
            
            Button {
                if isSignIn {
                    authenticationViewModel.signIn(with: email,
                                                   password: password) {
                        onDismiss(name)
                    }
                } else {
                    authenticationViewModel.signUp(with: email,
                                                   password: password,
                                                   name: name) {
                        onDismiss(name)
                    }
                }
            } label: {
                HStack {
                    Spacer()
                    Text("Done")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.accentColor)
                .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(authenticationViewModel: .init()) { _ in
            
        }
    }
}
