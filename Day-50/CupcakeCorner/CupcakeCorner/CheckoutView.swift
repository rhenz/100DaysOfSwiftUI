//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/27/20.
//

import SwiftUI

struct CheckoutView: View {
   @ObservedObject var order: Order
   
   var body: some View {
      GeometryReader { geo in
         ScrollView {
            VStack {
               Image("cupcakes")
                  .resizable()
                  .scaledToFit()
                  .frame(width: geo.size.width)
               
               Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                  .font(.title)
               
               Button("Place Order") {
                  // Place the order
               }
               .padding()
            }
         }
      }
   }
}

struct CheckoutView_Previews: PreviewProvider {
   static var previews: some View {
      CheckoutView(order: Order())
   }
}
