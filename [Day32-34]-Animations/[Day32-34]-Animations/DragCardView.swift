//
//  DragCardView.swift
//  [Day32-24]-Animations
//
//  Created by Lawrence on 8/12/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct DragCardView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.spring()) {
                        self.dragAmount = .zero
                    }
            }
        )
    }
}

struct DragCardView_Previews: PreviewProvider {
    static var previews: some View {
        DragCardView()
    }
}
