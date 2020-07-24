//
//  ContentView.swift
//  WeSplit
//
//  Created by Lawrence on 7/24/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let students = ["Kim Chiu", "Dalisay", "Harry Roque"]
    @State private var selectedStudent = "Kim Chiu"
    
    var body: some View {
        
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
        
        /*
        Form {
            ForEach(0 ..< 100) {
                Text("Row \($0)")
            }
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
