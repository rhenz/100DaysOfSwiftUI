//
//  Arrow.swift
//  Drawing
//
//  Created by Lawrence on 10/23/20.
//

import SwiftUI
struct Arrow: Shape {
   
   func path(in rect: CGRect) -> Path {
      var path = Path()
      path.move(to: CGPoint(x: rect.midX, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
      path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY / 4))
      path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY / 4))
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
      path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
      return path
   }
}

struct ColorCyclingRectangle: View {
   var amount = 0.0
   var steps = 100
   
   var body: some View {
      ZStack {
         ForEach(0..<steps) {
            value in
            Rectangle()
               .inset(by: CGFloat(value))
               .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.color(for: value, brightness: 1),
                                                                        self.color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            
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

struct ArrowView: View {
   @State private var colorCycle = 0.0
   @State private var lineWidth = 5.0
   @State private var showBoldLine = false
   
   
   var body: some View {
      VStack {
         Arrow()
            .stroke(Color.black, style: StrokeStyle(lineWidth: CGFloat(self.showBoldLine ? 20.0 : self.lineWidth), lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 300)
            .onTapGesture {
               withAnimation {
                  self.showBoldLine.toggle()
               }
            }
            .padding(.bottom, 50)
         
         ColorCyclingRectangle(amount: self.colorCycle)
            .frame(width: 300, height: 300)
         
         Text("Color Cycle")
         Slider(value: $colorCycle)
            .padding(.bottom, 50)
         
         Spacer()
      }
      .padding(.top, 50)
   }
   
}

struct Arrow_Previews: PreviewProvider {
   static var previews: some View {
      ArrowView()
   }
}
