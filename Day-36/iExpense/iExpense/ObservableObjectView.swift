//
//  ObservableObjectView.swift
//  iExpense
//
//  Created by Lawrence on 8/16/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Rhenzzee"
    @Published var lastName = "Codes"
}

struct ObservableObjectView: View {
    @ObservedObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is: \(user.firstName) \(user.lastName)")
            TextField("First Name:", text: $user.firstName)
            TextField("Last Name:", text: $user.lastName)
        }
    }
}

struct ObservableObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectView()
    }
}
