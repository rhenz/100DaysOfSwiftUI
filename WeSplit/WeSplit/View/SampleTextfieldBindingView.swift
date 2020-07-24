//
//  SampleTextfieldBindingView.swift
//  WeSplit
//
//  Created by Lawrence on 7/24/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct SampleTextfieldBindingView: View {
    
    // @State is specifically designed for simple properties that are stored in one view. As a result, Apple recommends we add private access control to those properties
    @State private var name = ""
    
    var body: some View {
        Form {
            // $ - TWO WAY BINDING
            TextField("Enter your name", text: $name)
            Text("Hello World! Your name is \(name)")
        }
    }
}

struct SampleTextfieldBindingView_Previews: PreviewProvider {
    static var previews: some View {
        SampleTextfieldBindingView()
    }
}
