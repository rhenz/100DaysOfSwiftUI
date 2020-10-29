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
   @Published var orderInfo: OrderInfo
   
   enum CodingKeys: CodingKey {
      case orderInfo
   }
   
   init() {
      self.orderInfo = OrderInfo()
   }
   
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(orderInfo, forKey: .orderInfo)
   }
   
   required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      orderInfo = try container.decode(OrderInfo.self, forKey: .orderInfo)
   }
}

struct OrderInfo: Codable {
   // MARK: - Properties
   var type = 0
   var quantity = 3
   
   var specialRequestedEnabled = false {
      didSet {
         if specialRequestedEnabled == false {
            extraFrosting = false
            addSprinkles = false
         }
      }
   }
   var extraFrosting = false
   var addSprinkles = false
   
   var name = ""
   var streetAddress = ""
   var city = ""
   var zip = ""
   
   
   // MARK: - Computed Properties
   var hasValidForm: Bool {
      if name.isEmpty ||
            streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            city.isEmpty ||
            zip.isEmpty {
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

