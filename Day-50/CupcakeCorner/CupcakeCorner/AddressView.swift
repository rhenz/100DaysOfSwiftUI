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
            TextField("Name", text: $order.name)
            TextField("Street Address", text: $order.streetAddress)
            TextField("City", text: $order.city)
            TextField("Zip", text: $order.zip)
         }
         
         Section {
            NavigationLink(
               destination: CheckoutView(order: order),
               label: {
                  Text("Check out")
               })
               .disabled(!order.hasValidForm)
               .foregroundColor(order.hasValidForm ? .blue : .gray)
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
