//
//  ContentView.swift
//  Moonshot
//
//  Created by Lawrence
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
               destination: MissionView(mission: mission, astronauts: self.astronauts),
               label: {
                  Image(mission.image)
                     .resizable()
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
