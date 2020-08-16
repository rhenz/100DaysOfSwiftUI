//
//  ShowingSheetView.swift
//  iExpense
//
//  Created by Lawrence on 8/16/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}


struct ShowingSheetView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // contents of the sheet
            SecondView(name: "John")
        }
    }
}

struct ShowingSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShowingSheetView()
    }
}
