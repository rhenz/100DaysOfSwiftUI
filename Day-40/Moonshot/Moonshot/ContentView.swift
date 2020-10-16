//
//  ContentView.swift
//  Moonshot
//
//  Created by Lawrence on 8/20/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   let missions: [Mission] = Bundle.main.decode("missions.json")
   let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   
   var body: some View {
      NavigationView {
         List(missions) { mission in
            NavigationLink(
               destination: Text("Detail View"),
               label: {
                  Image(mission.image)
                     .resizable()
//                     .aspectRatio(contentMode: .fit)
                     .scaledToFit()
                     .frame(width: 44, height: 44)
                  
                  VStack(alignment: .leading) {
                     Text(mission.displayName)
                        .font(.headline)
                     Text(mission.displayDate)
                  }
               })
         }
         .navigationBarTitle("Moonshot")
      }
   }
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
