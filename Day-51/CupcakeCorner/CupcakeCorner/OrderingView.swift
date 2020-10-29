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
               Picker("Select your cake type", selection: $order.type) {
                  ForEach(0..<Order.types.count) {
                     Text(Order.types[$0])
                  }
               }
               
               Stepper(value: $order.quantity, in: 3...20) {
                  Text("Number of cakes: \(order.quantity)")
               }
            }
            
            Section {
               Toggle(isOn: $order.specialRequestedEnabled
                        .animation(.linear)) {
                  Text("Any special requests?")
               }
               
               if order.specialRequestedEnabled {
                  Toggle(isOn: $order.extraFrosting) {
                     Text("Add extra frosting")
                  }
                  
                  Toggle(isOn: $order.addSprinkles) {
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
