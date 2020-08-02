//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Lawrence on 7/31/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
            .modifier(Title())
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
