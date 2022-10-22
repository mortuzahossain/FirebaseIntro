//
//  SignInView.swift
//  FirebaseIntro
//
//  Created by mortuza on 16/10/22.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing:15){
            Spacer()
            Text("Login Page")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
                .bold()
            TextField("Email", text: $email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            Button {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                   switch authResult {
                   case .none:
                       print("Could not sign in user.")
                   case .some(_):
                       print("User signed in")
                       withAnimation {
                           viewRouter.currentPage = .homePage
                       }
                   }
               }
            } label: {
                Text("Log In")
                   .bold()
                   .frame(width: 360, height: 50)
                   .background(.thinMaterial)
                   .cornerRadius(10)
            }
            Spacer()
            HStack {
               Text("Don't have an account?")
               Button(action: {
                   viewRouter.currentPage = .signUp
               }) {
                   Text("Sign Up")
               }
            }

        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
