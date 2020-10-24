//
//  ContentView.swift
//  Drawing
//
//  Created by Lawrence on 10/20/20.
//

import SwiftUI

struct Checkerboard: Shape {
   var rows: Int
   var columns: Int
   public var animatableData: AnimatablePair<Double, Double> {
      get {
         AnimatablePair(Double(rows), Double(columns))
      }
      set {
         self.rows = Int(newValue.first)
         self.columns = Int(newValue.second)
      }
   }
   
   func path(in rect: CGRect) -> Path {
      var path = Path()
      
      // figure out how big each row/column needs to be
      let rowSize = rect.height / CGFloat(rows)
      let columnSize = rect.width / CGFloat(columns)
      
      // loop over all rows and columns, making alternating squares colored
      for row in 0..<rows {
         for column in 0..<columns {
            if (row + column).isMultiple(of: 2) {
               // this square should be colored; add a rectangle here
               let startX = columnSize * CGFloat(column)
               let startY = rowSize * CGFloat(row)
               
               let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
               path.addRect(rect)
            }
         }
      }
      
      return path
   }
}



struct ContentView: View {
   @State private var rows = 4
   @State private var columns = 4
   
   var body: some View {
      Checkerboard(rows: rows, columns: columns)
         .onTapGesture(perform: {
            withAnimation(.linear(duration:3)) {
               self.rows = 8
               self.columns = 16
            }
         })
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

/**
 ZStack {
 Circle()
 .fill(Color(red: 1, green: 0, blue: 0))
 .frame(width: 200 * amount)
 .offset(x: -50, y: -80)
 
 Circle()
 .fill(Color(red: 0, green: 1, blue: 0))
 .frame(width: 200 * amount)
 .offset(x: 50, y: -80)
 .blendMode(.screen)
 
 Circle()
 .fill(Color(red: 0, green: 0, blue: 1))
 .frame(width: 200 * amount)
 .blendMode(.screen)
 }
 .frame(width: 300, height: 300)
 
 Slider(value: $amount)
 .padding()
 */
