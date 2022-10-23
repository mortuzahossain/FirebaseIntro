//
//  HomeView.swift
//  FirebaseIntro
//
//  Created by mortuza on 16/10/22.
//

import SwiftUI
import Firebase

struct Book:Codable,  Identifiable , Hashable{
 
  var id: String = UUID().uuidString
  var title: String
  var author: String
    
    var dictionary: [String: Any] {
           let data = (try? JSONEncoder().encode(self)) ?? Data()
           return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
       }
}

struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let email = Auth.auth().currentUser?.email ?? ""
    @ObservedObject var viewModel = BooksViewModel()
    let db = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            VStack(spacing:15){
                Text(email)
                List {
                    ForEach(viewModel.books, id: \.self) { book in
                        VStack(alignment: .leading) {
                          Text(book.title)
                            .font(.headline)
                          Text(book.author)
                            .font(.subheadline)
                        }
                    } .onDelete { IndexSet in
                        print(IndexSet)
                        deleteFromFirebase(offsets: IndexSet)
                    }
                }

            }
            .navigationTitle("Welcome")
            .onAppear() {
                self.viewModel.fetchData()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
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
                        Image(systemName: "xmark")
                    }.foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.addIntoFirease()
                    }, label: {
                        HStack {
                            Image(systemName: "plus")
                        }
                    })
                    .foregroundColor(.red)
                }
            }
        }
    }
    
    func addIntoFirease(){
        let id = Int.random(in: 0..<100)
        let book = Book(title: "Random book - \(id)", author: "Random author - \(id)")
        db.collection("books").document().setData(book.dictionary)
    }
    
    func deleteFromFirebase(offsets:IndexSet){
        for index in offsets {
            print(viewModel.books[index].id)
            print(viewModel.books[index].title)
            db.collection("books").document(viewModel.books[index].id).delete()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
