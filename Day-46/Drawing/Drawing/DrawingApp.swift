//
//  DrawingApp.swift
//  Drawing
//
//  Created by Lawrence on 10/20/20.
//

import SwiftUI

@main
struct DrawingApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ArrowView()
        }
    }
}

struct DrawingApp_Previews: PreviewProvider {
   static var previews: some View {
      /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
   }
}
