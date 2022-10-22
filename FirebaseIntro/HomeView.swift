//
//  HomeView.swift
//  FirebaseIntro
//
//  Created by mortuza on 16/10/22.
//

import SwiftUI
import Firebase
struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let email = Auth.auth().currentUser?.email ?? ""
    var body: some View {
        NavigationView {
            VStack(spacing:15){
                Text("Welcome \(email)")
                Button {
                    
                    do {
                       try Auth.auth().signOut()
                    }
                    catch let signOutError as NSError{
                        print("Error signing out: %@", signOutError)
                    }
                    withAnimation {
                        viewRouter.currentPage = .signIn
                    }
                } label: {
                    Text("Logout").bold()
                        .frame(width: 360, height: 50)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                }

            }
            .navigationTitle("Welcome")
            .toolbar {
                Button {
                    
                    do {
                       try Auth.auth().signOut()
                    }
                    catch let signOutError as NSError{
                        print("Error signing out: %@", signOutError)
                    }
                    withAnimation {
                        viewRouter.currentPage = .signIn
                    }
                } label: {
                    Image(systemImage: "arrowshape.turn.up.right.circle")
                }

            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
