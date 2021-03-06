//
//  ContentView.swift
//  Bookworm
//
//  Created by Lawrence on 11/1/20.
//

import SwiftUI

struct ContentView: View {
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
   
   @State private var showingAddScreen = false
   
   var body: some View {
      NavigationView {
         
         List {
            ForEach(books, id: \.self) { book in
               NavigationLink(destination: Text(book.title ?? "Unknown Title")) {
                  EmojiRatingView(rating: book.rating)
                     .font(.largeTitle)
                  
                  VStack(alignment: .leading) {
                     Text(book.title ?? "Unknown Title")
                        .font(.headline)
                     Text(book.author ?? "Unknown Author")
                        .foregroundColor(.secondary)
                  }
               }
            }
         }
         .navigationBarTitle("Bookworm")
         .navigationBarItems(trailing: Button(action: {
            self.showingAddScreen.toggle()
         }, label: {
            Image(systemName: "plus")
         }))
         .sheet(isPresented: $showingAddScreen, content: {
            AddBookView().environment(\.managedObjectContext, self.moc)
         })
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
