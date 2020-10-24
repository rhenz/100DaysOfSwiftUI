//
//  ContentView.swift
//  MilestoneProjects7-9
//
//  Created by Lawrence on 10/24/20.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var habits = Habits()
   
   @State private var showAddActivity = false
   
   var body: some View {
      let items = habits.items.enumerated().map { $0 }
      
      return NavigationView {
         List {
            ForEach(items, id: \.element.id) { index, habit in
               NavigationLink(
                  destination: ActivityDetailedView(habits: habits, selectedIndex: index),
                  label: {
                     VStack(alignment: .leading) {
                        Text(habit.title)
                           .font(.headline)
                        Text(habit.description)
                           .font(.subheadline)
                        Text("Completed \(habit.completionCount) times")
                           .font(.caption2)
                     }
                  })
            }
            .onDelete(perform: { indexSet in
               self.habits.removeItem(at: indexSet)
            })
            
         }
         .navigationBarTitle("Habit Tracking")
         .navigationBarItems(trailing: Button(action: {
            self.showAddActivity = true
         }, label: {
            Image(systemName: "plus.rectangle.on.rectangle")
               .resizable()
               .frame(width: 30, height: 25)
         }))
         .listStyle(PlainListStyle())
         .sheet(isPresented: $showAddActivity, content: {
            AddActivityView(habits: self.habits)
         })
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
