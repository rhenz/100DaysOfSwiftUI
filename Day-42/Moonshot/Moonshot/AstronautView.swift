//
//  AstronautView.swift
//  Moonshot
//
//  Created by Lawrence on 10/18/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
   let astronaut: Astronaut
   let missions: [Mission] = Bundle.main.decode("missions.json")
   
   var body: some View {
      GeometryReader { geometry in
         ScrollView(.vertical) {
            VStack {
               Image(self.astronaut.id)
                  .resizable()
                  .scaledToFit()
                  .frame(width: geometry.size.width)
               
               ZStack {
                  Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
                     .opacity(0.1)
                     .frame(height: 20)
                  Text("Bio")
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .padding(.horizontal)
               }
               Text(self.astronaut.description)
                  .padding()
               
               Text("Missions:")
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                  .padding()
               
               ForEach(listOfMissions) { mission in
                  HStack {
                     Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                     
                     VStack(alignment: .leading) {
                        Text(mission.displayName)
                           .font(.headline)
                        Text(mission.displayDate)
                     }
                  }
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding()
               }
            }
         }
      }
      .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
   }
   
   var listOfMissions: [Mission] {
      let x = missions.filter({ $0.crew.contains{$0.name == astronaut.id} })
      return x
   }
}

struct AstronautView_Previews: PreviewProvider {
   static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   static var previews: some View {
      AstronautView(astronaut: astronauts[0])
   }
}
