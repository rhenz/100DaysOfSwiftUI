//
//  Order.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/27/20.
//

import Foundation

class Order: ObservableObject, Codable {
   // MARK: - Static Properties
   static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
   
   // MARK: - Properties
   @Published var type = 0
   @Published var quantity = 3
   
   @Published var specialRequestedEnabled = false {
      didSet {
         if specialRequestedEnabled == false {
            extraFrosting = false
            addSprinkles = false
         }
      }
   }
   @Published var extraFrosting = false
   @Published var addSprinkles = false
   
   @Published var name = ""
   @Published var streetAddress = ""
   @Published var city = ""
   @Published var zip = ""
   
   
   // MARK: - Computed Properties
   var hasValidForm: Bool {
      if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
         return false
      }
      return true
   }
   
   var cost: Double {
      var cost = Double(quantity) * 2
      cost += Double(type) / 2
      
      if extraFrosting {
         cost += Double(quantity)
      }
      
      if addSprinkles {
         cost += Double(quantity) / 2
      }
      
      return cost
   }
   
   // MARK: - Init
   init() { }
   
   // MARK: - Codable
   private enum CodingKeys: CodingKey {
      case type
      case quantity
      case extraFrosting
      case addSpringkles
      case name
      case streetAddress
      case city
      case zip
   }
   
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(type, forKey: .type)
      try container.encode(quantity, forKey: .quantity)
      
      try container.encode(extraFrosting, forKey: .extraFrosting)
      try container.encode(addSprinkles, forKey: .addSpringkles)
      
      try container.encode(name, forKey: .name)
      try container.encode(streetAddress, forKey: .streetAddress)
      try container.encode(city, forKey: .city)
      try container.encode(zip, forKey: .zip)
   }
   
   required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      
      type = try container.decode(Int.self, forKey: .type)
      quantity = try container.decode(Int.self, forKey: .quantity)
      
      extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
      addSprinkles = try container.decode(Bool.self, forKey: .addSpringkles)
      
      name = try container.decode(String.self, forKey: .name)
      streetAddress = try container.decode(String.self, forKey: .streetAddress)
      city = try container.decode(String.self, forKey: .city)
      zip = try container.decode(String.self, forKey: .zip)
   }
   
   
}

