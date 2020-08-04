//
//  StepperView.swift
//  BetterRest
//
//  Created by Lawrence on 8/3/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper(value: $sleepAmount, in: 4...12, step: 0.5) {
            Text("\(sleepAmount, specifier: "%g") hours")
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
