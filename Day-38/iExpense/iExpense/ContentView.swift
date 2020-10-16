//
//  ContentView.swift
//  iExpense
//
//  Created by Lawrence on 8/16/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published private(set) var items: [ExpenseItem] = []
    
    // MARK: - Helper Method
    public func addItem(item: ExpenseItem) {
        self.items.append(item)
        
        self.saveToUserDefaults()
    }
    
    public func removeItem(at indexOffsets: IndexSet) {
        self.items.remove(atOffsets: indexOffsets)
        
        self.saveToUserDefaults()
    }
    
    private func saveToUserDefaults() {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(self.items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        AmountText(amount: UInt(item.amount))
                    }
                }
                .onDelete(perform: self.expenses.removeItem(at:))
            }
            .navigationBarTitle("iExpenses")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddExpense = true
            }, label: {
                Image(systemName: "plus")
            }))
            
            .sheet(isPresented: $showingAddExpense) {
                // show an AddView
                AddView(expenses: self.expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct AmountText: View {
    var amount: UInt
    private var textColor: Color {
        if amount < 10 {
            return Color.green
        } else if amount >= 10 && amount < 100 {
            return Color.orange
        } else {
            return Color.red
        }
    }
    
    var body: some View {
        Text("$\(self.amount)")
        .foregroundColor(textColor)
    }
}
