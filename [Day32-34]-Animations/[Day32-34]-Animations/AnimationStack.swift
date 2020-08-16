//
//  AnimationStack.swift
//  [Day32-24]-Animations
//
//  Created by Lawrence on 8/11/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.default)
    }
    
    // Orders of modifier matters
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
