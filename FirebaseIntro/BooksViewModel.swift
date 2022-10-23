//
//  BooksViewModel.swift
//  FirebaseIntro
//
//  Created by mortuza on 23/10/22.
//

import Foundation
import Firebase

class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
  
  // code to fetch data
    
    private var db = Firestore.firestore()
    func fetchData() {
        db.collection("books").addSnapshotListener { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
          }

          self.books = documents.map { queryDocumentSnapshot -> Book in
            let data = queryDocumentSnapshot.data()
            let title = data["title"] as? String ?? ""
            let author = data["author"] as? String ?? ""

            return Book(id: .init(), title: title, author: author)
          }
        }
      }
}
