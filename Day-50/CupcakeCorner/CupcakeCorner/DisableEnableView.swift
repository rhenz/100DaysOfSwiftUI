//
//  DisableEnableView.swift
//  CupcakeCorner
//
//  Created by Lawrence on 10/26/20.
//

import SwiftUI

struct DisableEnableView: View {
   @State var username = ""
   @State var email = ""
   
   var disableForm: Bool {
      username.count < 5 || email.count < 5
   }
   
    var body: some View {
      Form {
         Section {
            TextField("Username", text: $username)
            TextField("Email", text: $email)
         }
         
         Section {
            Button("Create Account") {
               print("Creating Account")
            }
         }
         .disabled(disableForm)
      }
    }
}

struct DisableEnableView_Previews: PreviewProvider {
    static var previews: some View {
        DisableEnableView()
    }
}
