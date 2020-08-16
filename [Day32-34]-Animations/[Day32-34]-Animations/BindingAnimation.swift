//
//  BindingAnimation.swift
//  [Day32-24]-Animations
//
//  Created by Lawrence on 8/10/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct BindingAnimation: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value:
                $animationAmount.animation(
                    Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
                ), in: 1...10
            )
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct BindingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimation()
    }
}
