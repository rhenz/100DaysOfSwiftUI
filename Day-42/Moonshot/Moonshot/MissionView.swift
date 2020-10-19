//
//  MissionView.swift
//  Moonshot
//
//  Created by Lawrence on 10/18/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct MissionView: View {
   struct CrewMember {
      let role: String
      let astronaut: Astronaut
   }
   
   let mission: Mission
   let astronauts: [CrewMember]
   
   var body: some View {
      GeometryReader { geometry in
         ScrollView(.vertical) {
            VStack {
               Image(self.mission.image)
                  .resizable()
                  .scaledToFit()
                  .frame(maxWidth: geometry.size.width * 0.7)
                  .padding(.top)
               
               ZStack {
                  Color(.systemGray)
                     .opacity(0.1)
                     .frame(height: 20)
                     .clipShape(Capsule())
                     .padding(.horizontal, 10)
                  Text("Launch Date: \(self.mission.displayDate)")
                     .font(.caption)
                     .foregroundColor(Color(.black))
               }
               
               
               Text(self.mission.description)
                  .padding()
               
               ForEach(self.astronauts, id: \.role) { crewMember in
                  NavigationLink(
                     destination: AstronautView(astronaut: crewMember.astronaut),
                     label: {
                        AstronautRow(crewMember: crewMember)
                     })
                     .buttonStyle(PlainButtonStyle())
               }
               Spacer(minLength: 25)
            }
         }
      }
      .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
   }
   
   init(mission: Mission, astronauts: [Astronaut]) {
      self.mission = mission
      var matches = [CrewMember]()
      
      for member in mission.crew {
         if let match = astronauts.first(where: { $0.id == member.name }) {
            matches.append(CrewMember(role: member.role, astronaut: match))
         } else {
            fatalError("Missing \(member)")
         }
      }
      self.astronauts = matches
   }
}

struct MissionView_Previews: PreviewProvider {
   static let mission: [Mission] = Bundle.main.decode("missions.json")
   static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
   
   static var previews: some View {
      MissionView(mission: mission[0], astronauts: astronauts)
   }
}

struct AstronautRow: View {
   var crewMember: MissionView.CrewMember
   
   var body: some View {
      HStack {
         Image(crewMember.astronaut.id)
            .resizable()
            .frame(width: 83, height: 60)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
         VStack(alignment: .leading) {
            Text(crewMember.astronaut.name)
               .font(.headline)
            
            Text(crewMember.role)
               .foregroundColor(.secondary)
         }
         
         Spacer()
      }
      .padding(.horizontal)
   }
}
