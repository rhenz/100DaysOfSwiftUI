//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Lawrence on 7/28/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingAlert = false
    var body: some View {
        Button("Show Alert") {
            self.isShowingAlert = true
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
