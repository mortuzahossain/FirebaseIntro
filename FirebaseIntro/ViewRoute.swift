//
//  ViewRoute.swift
//  FirebaseIntro
//
//  Created by mortuza on 16/10/22.
//

import Foundation

enum Page {
    case signUp
    case signIn
    case homePage
}

class ViewRouter:ObservableObject {
    @Published var currentPage:Page = .signIn
}
