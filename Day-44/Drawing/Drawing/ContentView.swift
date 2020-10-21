//
//  ContentView.swift
//  Drawing
//
//  Created by Lawrence on 10/20/20.
//

import SwiftUI

struct ColorCyclingCircle: View {
   var amount = 0.0
   var steps = 100
   
   var body: some View {
      ZStack {
         ForEach(0..<steps) { value in
            Circle()
               .inset(by: CGFloat(value))
//               .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
               .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.color(for: value, brightness: 1), self.color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom))
         }
      }
      .drawingGroup()
   }
   
   func color(for value: Int, brightness: Double) -> Color {
      var targetHue = Double(value) / Double(self.steps) + self.amount
      
      if targetHue > 1 {
         targetHue -= 1
      }
      
      return Color(hue: targetHue, saturation: 1, brightness: brightness)
   }
}

struct ContentView: View {
   @State private var colorCycle = 0.0
   
   var body: some View {
//      Capsule()
//         .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
//         .frame(width: 300, height: 200)
      
      VStack {
         ColorCyclingCircle(amount: self.colorCycle)
            .frame(width: 300, height: 300)
         
         Slider(value: $colorCycle)
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
