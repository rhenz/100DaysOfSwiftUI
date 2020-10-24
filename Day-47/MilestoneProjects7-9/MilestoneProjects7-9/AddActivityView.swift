//
//  AddActivityView.swift
//  MilestoneProjects7-9
//
//  Created by Lawrence on 10/24/20.
//

import SwiftUI

struct AddActivityView: View {
   @Environment(\.presentationMode) var presentationMode
   
   @ObservedObject var habits: Habits
   
   @State private var title: String = ""
   @State private var description: String = ""
   @State private var showAlert = false
   
   var body: some View {
      NavigationView {
         List {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
         }
         .navigationBarTitle("Add Activity")
         .navigationBarItems(trailing: Button(action: {
            self.saveActivity()
         }, label: {
            Text("Save")
         }))
         .listStyle(PlainListStyle())
         .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Notice"), message: Text("Enter valid Title and Description"), dismissButton: .default(Text("Ok")))
         })
      }
   }
   
   private func saveActivity() {
      guard !title.isEmpty, !description.isEmpty else {
         self.showAlert = true
         return
      }
      
      // Save to user defaults
      self.habits.addItem(item: Habit(title: title, description: description))
      
      // Dismiss
      self.presentationMode.wrappedValue.dismiss()
   }
}

struct AddActivityView_Previews: PreviewProvider {
   static var previews: some View {
      AddActivityView(habits: Habits())
   }
}
