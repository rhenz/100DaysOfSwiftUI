//
//  Habit.swift
//  MilestoneProjects7-9
//
//  Created by Lawrence on 10/24/20.
//

import Foundation

struct Habit: Codable, Identifiable {
   var id = UUID()
   var title: String
   var description: String
   var completionCount: Int = 0
}


class Habits: ObservableObject {
   @Published private(set) var items: [Habit] = []
   
   // MARK: - Helper Method
   public func addItem(item: Habit) {
       self.items.append(item)
       self.saveToUserDefaults()
   }
   
   public func removeItem(at indexOffsets: IndexSet) {
       self.items.remove(atOffsets: indexOffsets)
       self.saveToUserDefaults()
   }
   
   public func updateHabitCompletionCount(at index: Int) {
      self.items[index].completionCount += 1
      self.saveToUserDefaults()
   }
   
   private func saveToUserDefaults() {
       let encoder = JSONEncoder()
       if let encoded = try? encoder.encode(self.items) {
           UserDefaults.standard.set(encoded, forKey: "Habits")
       }
   }
   
   init() {
       if let items = UserDefaults.standard.data(forKey: "Habits") {
           let decoder = JSONDecoder()
           if let decoded = try? decoder.decode([Habit].self, from: items) {
               self.items = decoded
               return
           }
       }
       
       self.items = []
   }
}
