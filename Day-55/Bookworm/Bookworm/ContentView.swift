//
//  ContentView.swift
//  Bookworm
//
//  Created by Lawrence on 11/1/20.
//

import SwiftUI

struct ContentView: View {
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Book.entity(), sortDescriptors: [
      NSSortDescriptor(keyPath: \Book.title, ascending: true),
      NSSortDescriptor(keyPath: \Book.author, ascending: true)
   ]) var books: FetchedResults<Book>
   
   @State private var showingAddScreen = false
   
   var body: some View {
      NavigationView {
         List {
            ForEach(books, id: \.self) { book in
               NavigationLink(destination: DetailView(book: book)) {
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
            .onDelete(perform: deleteBooks(at:))
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
         .listStyle(PlainListStyle())
      }
   }
   
   func deleteBooks(at offsets: IndexSet) {
      for offset in offsets {
         let book = books[offset]
         moc.delete(book)
      }
      
      try? moc.save()
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
