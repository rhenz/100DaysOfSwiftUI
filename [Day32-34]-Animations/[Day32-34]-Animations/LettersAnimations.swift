//
//  LettersAnimations.swift
//  [Day32-24]-Animations
//
//  Created by Lawrence on 8/12/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct LettersAnimations: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct LettersAnimations_Previews: PreviewProvider {
    static var previews: some View {
        LettersAnimations()
    }
}
