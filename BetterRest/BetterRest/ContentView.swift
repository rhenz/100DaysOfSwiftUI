//
//  ContentView.swift
//  BetterRest
//
//  Created by Lawrence on 8/3/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    
    var body: some View {
//        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
        .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
