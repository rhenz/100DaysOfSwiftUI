//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/27/20.
//

import SwiftUI

struct CheckoutView: View {
   @ObservedObject var order: Order
   
   @State private var showAlert = false
   @State private var alertMessage = ""
   @State private var alertTitle = ""
   
   var body: some View {
      GeometryReader { geo in
         ScrollView {
            VStack {
               Image("cupcakes")
                  .resizable()
                  .scaledToFit()
                  .frame(width: geo.size.width)
               
               Text("Your total is $\(self.order.orderInfo.cost, specifier: "%.2f")")
                  .font(.title)
               
               Button("Place Order") {
                  self.placeOrder()
               }
               .padding()
            }
         }
      }
      .navigationBarTitle("Check out", displayMode: .inline)
      .alert(isPresented: $showAlert, content: {
         Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
      })
   }
   
   func placeOrder() {
      guard let encoded = try? JSONEncoder().encode(order.orderInfo) else {
         print("Failed to encode order")
         return
      }
      
      let url = URL(string: "https://reqres.in/api/cupcakes")!
      
      var request = URLRequest(url: url)
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpMethod = "POST"
      request.httpBody = encoded
      
      URLSession.shared.dataTask(with: request) { data, response, error in
         guard let data = data else {
            self.showErrorAlert(message: error?.localizedDescription ?? "Unknown error")
            return
         }
         
         if let decodedOrder = try? JSONDecoder().decode(OrderInfo.self, from: data) {
            self.showSuccessAlert(message: "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!")
         } else {
            print("Invalid response from server")
         }
         
      }.resume()
   }
   
   private func showErrorAlert(message: String) {
      self.alertTitle = "Error"
      self.alertMessage = message
      self.showAlert = true
   }
   
   private func showSuccessAlert(message: String) {
      self.alertTitle = "Thank you!"
      self.alertMessage = message
      self.showAlert = true
   }
}

struct CheckoutView_Previews: PreviewProvider {
   static var previews: some View {
      CheckoutView(order: Order())
   }
}
