//
//  ButtonView.swift
//  GuessTheFlag
//
//  Created by Lawrence on 7/28/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        //        Button("Tap me!") {
        //            print("Hello!")
        //        }
        
        Button(action: {
            print("Button was tapped")
        }) {
            HStack(spacing: 10) {
                Image(systemName: "pencil")
                Text("Tap Me")
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
