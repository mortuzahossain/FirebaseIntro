//
//  SignUpView.swift
//  FirebaseIntro
//
//  Created by mortuza on 16/10/22.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing:15){
            Spacer()
            Text("Signup Page")
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
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                       
                       switch authResult {
                       case .none:
                           print("Could not create account.")
                       case .some(_):
                           print("User created")
                           viewRouter.currentPage = .homePage
                       }
                   }
            } label: {
                Text("Signup")
                   .bold()
                   .frame(width: 360, height: 50)
                   .background(.thinMaterial)
                   .cornerRadius(10)
            }
            Spacer()
            HStack {
               Text("Already have an account?")
               Button(action: {
                   viewRouter.currentPage = .signIn
               }) {
                   Text("Login")
               }
            }
        }.padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
