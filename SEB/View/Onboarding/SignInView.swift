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
    
    @State var rotation = Angle.zero
    @State var scale = 1.0
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
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
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .padding(.bottom)
                .autocorrectionDisabled()

            
            SecureField("Password", text: $password)
            
            HStack {
                Button {
                    authenticationViewModel.signIn(with: email,
                                                   password: password)
                } label: {
                    HStack {
                        Spacer()
                        Text("Sign In")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                }
                
                Button {
                    authenticationViewModel.signUp(with: email,
                                                   password: password)
                } label: {
                    HStack {
                        Spacer()
                        Text("Sign Up")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(authenticationViewModel: .init())
    }
}
