//
//  SwiftUIAnimationView.swift
//  [Day32-24]-Animations
//
//  Created by Lawrence on 8/11/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct SwiftUIAnimationView: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .bottom, endPoint: .top))
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct SwiftUIAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimationView()
    }
}
