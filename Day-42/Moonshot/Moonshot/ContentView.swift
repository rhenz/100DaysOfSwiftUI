//
//  ContentView.swift
//  Moonshot
//
//  Created by Lawrence
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   @State var showCrews: Bool = false
   
   let missions: [Mission] = Bundle.main.decode("missions.json")
   let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   
   var barButtonItemTitle: String {
      return showCrews ? "Show Missions" : "Show Crews"
   }
   
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
                     Text(subtitle(mission: mission))
                        .font(.subheadline)
                  }
               })
         }
         .navigationBarTitle("Moonshot")
         .navigationBarItems(trailing: Button(action: { self.showCrews.toggle() }) {
            Text(barButtonItemTitle)
         })
         .listStyle(PlainListStyle())
      }
   }
   
   

   func subtitle(mission: Mission) -> String {
      let crews = mission.crew.map { $0.name }
      var crewNames: [String] = []
      for name in crews {
         if let fullName = astronauts.filter({ $0.id == name }).first {
            crewNames.append(fullName.name)
         }
      }
      let formattedText = crewNames.map { "\($0)"}.joined(separator: ", ")
      return showCrews ? formattedText : mission.displayDate
   }
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
//         .environment(\.colorScheme, .dark)
   }
}
