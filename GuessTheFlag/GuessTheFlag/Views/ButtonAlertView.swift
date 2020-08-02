//
//  ButtonAlertView.swift
//  GuessTheFlag
//
//  Created by Lawrence on 7/30/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ButtonAlertView: View {
    @State private var isShowingAlert = false
    var body: some View {
        Button("Show Alert") {
            self.isShowingAlert = true
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct ButtonAlertView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAlertView()
    }
}
