//
//  Order.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/27/20.
//

import Foundation

class Order: ObservableObject {
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
}
