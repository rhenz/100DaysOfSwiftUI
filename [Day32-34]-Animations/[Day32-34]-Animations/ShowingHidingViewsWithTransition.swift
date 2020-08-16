//
//  ShowingHidingViewsWithTransition.swift
//  [Day32-24]-Animations
//
//  Created by Lawrence on 8/12/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ShowingHidingViewsWithTransition: View {
    @State private var isShowingRed = false
        var body: some View {
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        self.isShowingRed.toggle()
                    }
                }
                
                if isShowingRed {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
        }
}

struct ShowingHidingViewsWithTransition_Previews: PreviewProvider {
    static var previews: some View {
        ShowingHidingViewsWithTransition()
    }
}
