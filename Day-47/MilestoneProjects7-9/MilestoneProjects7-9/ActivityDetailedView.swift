//
//  ActivityDetailedView.swift
//  MilestoneProjects7-9
//
//  Created by Lawrence on 10/24/20.
//

import SwiftUI

struct ActivityDetailedView: View {
   @ObservedObject var habits: Habits
   
   var selectedIndex: Int
   
   var body: some View {
      List {
         // Title
         VStack(alignment: .leading, spacing: 10) {
            Text("Title:")
               .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            Text(habits.items[selectedIndex].title)
         }
         
         // Description
         VStack(alignment: .leading, spacing: 10) {
            Text("Description:")
               .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            Text(habits.items[selectedIndex].description)
         }
         
         // Completion
         VStack(alignment: .leading, spacing: 10) {
            Text("Update Times of Completion:")
               .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            
            HStack {
               Text("Completed \(habits.items[selectedIndex].completionCount) times")
               Spacer()
               Button(action: {
                  updateCompletionCount()
               }, label: {
                  Image(systemName: "plus.app.fill")
                     .resizable()
                     .frame(width: 30, height: 30)
                     .foregroundColor(.blue)
               })
            }
         }
      }
      .navigationBarTitle("Details")
      .listStyle(PlainListStyle())
      .buttonStyle(PlainButtonStyle())
   }
   
   private func updateCompletionCount() {
      self.habits.updateHabitCompletionCount(at: selectedIndex)
   }
}

struct ActivityDetailedView_Previews: PreviewProvider {
   static var previews: some View {
      ActivityDetailedView(habits: Habits(), selectedIndex: 0)
   }
}
