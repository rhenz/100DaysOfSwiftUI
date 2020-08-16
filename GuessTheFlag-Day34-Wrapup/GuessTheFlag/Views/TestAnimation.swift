//
//  TestAnimation.swift
//  GuessTheFlag
//
//  Created by Lawrence on 8/13/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct TestAnimation: View {
    @State var rotation = 0.0

    var body: some View {
        Rectangle()
            .fill(Color.red)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(rotation))
            .animation(Animation.easeInOut(duration: 3).delay(1))
            .onTapGesture {
                self.rotation += 360
            }
    }
}

struct TestAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TestAnimation()
    }
}
