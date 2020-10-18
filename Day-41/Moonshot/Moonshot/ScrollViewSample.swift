//
//  ScrollViewSample.swift
//  Moonshot
//
//  Created by Lawrence on 8/20/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct CustomText: View {
   var text: String
   var body: some View {
      Text(text)
   }
   
   public init(_ text: String) {
      self.text = text
   }
}

struct ScrollViewSample: View {
   var body: some View {
      ScrollView(.vertical) {
         VStack(spacing: 10) {
            ForEach(0..<100) {
               CustomText("Item \($0)")
            }
         }
         .frame(maxWidth: .infinity)
      }
   }
}

struct ScrollViewSample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewSample()
    }
}
