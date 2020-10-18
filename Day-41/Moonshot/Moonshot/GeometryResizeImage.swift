//
//  GeometryResizeImage.swift
//  Moonshot
//
//  Created by Lawrence on 8/20/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct GeometryResizeImage: View {
   var body: some View {
      VStack {
         GeometryReader { geo in
            Image("sample")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: geo.size.width)
         }
      }
   }
}

struct GeometryResizeImage_Previews: PreviewProvider {
   static var previews: some View {
      GeometryResizeImage()
   }
}
