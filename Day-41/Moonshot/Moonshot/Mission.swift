//
//  Mission.swift
//  Moonshot
//
//  Created by Lawrence on 10/16/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
   struct CrewRole: Codable {
      let name: String
      let role: String
   }
   
   let id: Int
   let launchDate: Date?
   let crew: [CrewRole]
   let description: String
   
   var displayName: String {
      "Apollo \(id)"
   }
   
   var image: String {
      "apollo\(id)"
   }
   
   var displayDate: String {
      if let launchDate = launchDate {
         let formatter = DateFormatter()
         formatter.dateStyle = .long
         return formatter.string(from: launchDate)
      } else {
         return "N/A"
      }
   }
}
