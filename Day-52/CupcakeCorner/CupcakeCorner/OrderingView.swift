//
//  OrderingView.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/27/20.
//

import SwiftUI

struct OrderingView: View {
   @ObservedObject var order = Order()
   
   var body: some View {
      NavigationView {
         Form {
            Section {
               Picker("Select your cake type", selection: $order.orderInfo.type) {
                  ForEach(0..<Order.types.count) {
                     Text(Order.types[$0])
                  }
               }
               
               Stepper(value: $order.orderInfo.quantity, in: 3...20) {
                  Text("Number of cakes: \(order.orderInfo.quantity)")
               }
            }
            
            Section {
               Toggle(isOn: $order.orderInfo.specialRequestedEnabled
                        .animation(.linear)) {
                  Text("Any special requests?")
               }
               
               if order.orderInfo.specialRequestedEnabled {
                  Toggle(isOn: $order.orderInfo.extraFrosting) {
                     Text("Add extra frosting")
                  }
                  
                  Toggle(isOn: $order.orderInfo.addSprinkles) {
                     Text("Add extra sprinkles")
                  }
               }
            }
            
            Section {
               NavigationLink(
                  destination: AddressView(order: order),
                  label: {
                     Text("Delivery Details")
                  })
            }
         }
         .navigationBarTitle("Cupcake Corner")
      }
   }
}

struct OrderingView_Previews: PreviewProvider {
   static var previews: some View {
      OrderingView()
   }
}
