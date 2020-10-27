//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/26/20.
//

import SwiftUI

class User: ObservableObject, Codable {
   @Published var name = "John Salvador"
   
   enum CodingKeys: CodingKey {
      case name
   }
   
   required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      name = try container.decode(String.self, forKey: .name)
   }
   
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(name, forKey: .name)
   }
}

struct Response: Codable {
   var results: [Result]
}

struct Result: Codable {
   var trackId: Int
   var trackName: String
   var collectionName: String
}

struct ContentView: View {
   @State var result = [Result]()
   
   var body: some View {
      
      NavigationView {
         List(result, id: \.trackId) { item in
            VStack(alignment: .leading) {
               Text(item.trackName)
                  .font(.headline)
               Text(item.collectionName)
            }
         }
         .onAppear(perform: loadData)
         .navigationBarTitle("Taylor Swift Songs")
         .navigationBarItems(trailing:
            NavigationLink(
               destination: DisableEnableView(),
               label: {
                  Text("Try Form")
               })
         )
         .listStyle(PlainListStyle())
      }
   }
   
   func loadData() {
      guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
         print("Invalid URL")
         return
      }
      
      let request = URLRequest(url: url)
      
      URLSession.shared.dataTask(with: request) { data, response, error in
         if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
               DispatchQueue.main.async {
                  self.result = decodedResponse.results
               }
               return
            }
         }
         
         print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
      }.resume()
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
