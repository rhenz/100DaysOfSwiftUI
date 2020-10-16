//
//  ContentView.swift
//  Moonshot
//
//  Created by Lawrence on 8/20/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
      Button("Decode JSON") {
         let input = """
         {
            "name": "RhenzZee Codes",
            "address": {
               "street": "Anchorvale Link",
               "city": "Singapore"
            }
         }
         """
         
         let data = Data(input.utf8)
         
         let decoder = JSONDecoder()
         let user = try? decoder.decode(User.self, from: data)
         
         print("User: \(user?.name ?? "")")
         print("Street: \(user?.address.street ?? "")")
         print("City: \(user?.address.city ?? "")")
      }
   }
}

struct User: Decodable {
   var name: String
   var address: Address
}

struct Address: Decodable {
   var street: String
   var city: String
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
