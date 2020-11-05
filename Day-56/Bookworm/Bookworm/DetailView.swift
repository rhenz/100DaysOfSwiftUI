//
//  DetailView.swift
//  Bookworm
//
//  Created by Lawrence on 11/3/20.
//

import CoreData
import SwiftUI

struct DetailView: View {
   @Environment(\.managedObjectContext) var moc
   @Environment(\.presentationMode) var presentationMode
   @State private var showingDeleteAlert = false
   
   let book: Book
   
   var body: some View {
      GeometryReader { geometry in
         VStack {
            ZStack(alignment: .bottomTrailing) {
               Image(self.book.genre ?? "Fantasy")
                  .frame(maxWidth: geometry.size.width)
               
               Text(self.book.genre?.uppercased() ?? "FANTASY")
                  .font(.caption)
                  .fontWeight(.black)
                  .padding(8)
                  .foregroundColor(.white)
                  .background(Color.black.opacity(0.75))
                  .clipShape(Capsule())
                  .offset(x: -5, y: -5)
            }
            
            Text(readableDate(self.book.date))
               .font(.caption)
               .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
            Text(self.book.author ?? "Unknown Auther")
               .font(.title)
               .foregroundColor(.secondary)
            
            Text(self.book.review ?? "No Review")
               .padding()
            
            RatingView(rating: .constant(Int(self.book.rating)))
               .font(.largeTitle)
            
            Spacer()
         }
      }
      .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
      .navigationBarItems(trailing: Button(action: {
         self.showingDeleteAlert = true
      }, label: {
         Image(systemName: "trash")
      }))
      .alert(isPresented: $showingDeleteAlert, content: {
         Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete"), action: self.deleteBook), secondaryButton: .cancel())
      })
   }
   
   func deleteBook() {
      moc.delete(book)
//      try? self.moc.save()
      presentationMode.wrappedValue.dismiss()
   }
   
   private func readableDate(_ date: Date?) -> String {
      var convertDate = date == nil ? Date() : date!
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .medium
      return dateFormatter.string(from: convertDate)
   }
}

struct DetailView_Previews: PreviewProvider {
   static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
   static var previews: some View {
      let book = Book(context: moc)
      book.title = "Test Book"
      book.author = ""
      book.genre = ""
      book.rating = 4
      book.review = "This was a great book!!"
      
      return NavigationView {
         DetailView(book: book)
      }
   }
}
