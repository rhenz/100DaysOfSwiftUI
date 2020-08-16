//
//  ListOnDeleteView.swift
//  iExpense
//
//  Created by Lawrence on 8/16/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ListOnDeleteView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows(at:))
                }
                
                Button("Add number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
        .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ListOnDeleteView_Previews: PreviewProvider {
    static var previews: some View {
        ListOnDeleteView()
    }
}
