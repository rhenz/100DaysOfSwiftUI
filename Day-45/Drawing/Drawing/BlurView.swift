//
//  BlurView.swift
//  Drawing
//
//  Created by Lawrence on 10/22/20.
//

import SwiftUI

struct BlurView: View {
   @State private var amount: CGFloat = 0.0
   var body: some View {
      VStack {
         Image("Example")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .saturation(Double(amount))
            .blur(radius: (1-amount) * 20)
         
         Slider(value: $amount)
            .padding()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.black)
      .edgesIgnoringSafeArea(.all)
   }
}

struct BlurView_Previews: PreviewProvider {
   static var previews: some View {
      BlurView()
   }
}
