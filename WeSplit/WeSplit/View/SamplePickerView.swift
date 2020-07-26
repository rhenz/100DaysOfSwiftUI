//
//  SamplePickerView.swift
//  WeSplit
//
//  Created by Lawrence on 7/25/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct SamplePickerView: View {
    
    private let cats = ["Chabby", "Oli", "Nimbus"]
    @State private var selectedCat = ""
    @State private var selectedCatIndex = 0
    
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
    @State private var selectedFrameworkIndex = 0
    
    var body: some View {

        VStack {
            Picker(selection: $selectedCatIndex, label: Text("")) {
                ForEach(0 ..< cats.count) {
                    Text(self.cats[$0])
                }
            }
            Text("Selected Cat: \(cats[selectedCatIndex])")
        }
    }
}

struct SamplePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SamplePickerView()
    }
}
