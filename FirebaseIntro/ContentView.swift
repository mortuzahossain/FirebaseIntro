//
//  ContentView.swift
//  FirebaseIntro
//
//  Created by mortuza on 16/10/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .signUp:
            SignUpView()
        case .signIn:
            SignInView()
        case .homePage:
            HomeView()
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewRouter())
    }
}
