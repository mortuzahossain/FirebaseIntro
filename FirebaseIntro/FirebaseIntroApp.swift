//
//  FirebaseIntroApp.swift
//  FirebaseIntro
//
//  Created by mortuza on 16/10/22.
//

import SwiftUI
import FirebaseCore
@main
struct FirebaseIntroApp: App {

    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
        }
    }
}
