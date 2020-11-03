//
//  SizeClassesView.swift
//  Bookworm
//
//  Created by Lawrence on 11/1/20.
//

import SwiftUI

struct SizeClassesView: View {
   @Environment(\.presentationMode) var presentationMode
   @Environment(\.horizontalSizeClass) var sizeClass
   
   var body: some View {
      if sizeClass == .compact {
         return AnyView(VStack {
            Text("Active size class:")
            Text("Compact")
         }
         .font(.largeTitle))
      } else {
         return AnyView(HStack {
            Text("Active Size Class:")
            Text("REGULAR")
         }
         .font(.largeTitle))
      }
   }
}

struct SizeClassesView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         SizeClassesView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 mini"))
            .previewDisplayName("iPhone 12 mini")
      }
   }
}
