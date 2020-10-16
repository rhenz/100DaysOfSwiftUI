//
//  AddView.swift
//  iExpense
//
//  Created by Lawrence on 8/18/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var showAlert = false
    
    private var alertTitle = "Notice"
    private var alertMessage = "Enter valid amount."
    
    static let types = ["Business", "Personal"]
    
    public init(expenses: Expenses) {
        self.expenses = expenses
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button(action: self.validateAmountInput) {
                Text("Save")
            })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(self.alertTitle), message: Text(self.alertMessage), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    public func validateAmountInput() {
        if let actualAmount = Int(self.amount) {
            let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
            self.expenses.addItem(item: item)
            self.presentationMode.wrappedValue.dismiss()
        } else {
            // Show Error
            showAlert = true
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
