//
//  PulsatingView.swift
//  [Day32-24]-Animations
//
//  Created by Lawrence on 8/10/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct PulsatingView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            // do nothing
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
            )
        )
        .onAppear {
            self.animationAmount = 2
        }
        //        .scaleEffect(animationAmount)
        //        .animation(.easeInOut(duration: 2))
        //            .animation(.interpolatingSpring(stiffness: 50, damping: 1))
        //        .animation(
        //            Animation.easeInOut(duration: 2)
        //            .delay(1)
        //        )
        
    }
}

struct PulsatingView_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingView()
    }
}
