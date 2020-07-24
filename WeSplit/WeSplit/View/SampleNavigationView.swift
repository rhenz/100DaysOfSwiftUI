//
//  SampleNavigationView.swift
//  WeSplit
//
//  Created by Lawrence on 7/24/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct SampleNavigationView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello world again?")
                }
            }
            .navigationBarTitle("NavigationTitle")
        }
    }
}

struct SampleNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SampleNavigationView()
    }
}
