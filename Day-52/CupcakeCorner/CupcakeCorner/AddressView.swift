//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/27/20.
//

import SwiftUI

struct AddressView: View {
   @ObservedObject var order: Order
   
   @State private var username: String = ""
   @State private var password: String = ""
   
   var body: some View {
      Form {
         Section {
            TextField("Name", text: $order.orderInfo.name)
            TextField("Street Address", text: $order.orderInfo.streetAddress)
            TextField("City", text: $order.orderInfo.city)
            TextField("Zip", text: $order.orderInfo.zip)
         }
         
         Section {
            NavigationLink(
               destination: CheckoutView(order: order),
               label: {
                  Text("Check out")
               })
               .disabled(!order.orderInfo.hasValidForm)
               .foregroundColor(order.orderInfo.hasValidForm ? .blue : .gray)
         }
      }
      .navigationBarTitle("Delivery Details", displayMode: .inline)
      
   }
}

struct AddressView_Previews: PreviewProvider {
   static var previews: some View {
      AddressView(order: Order())
   }
}
