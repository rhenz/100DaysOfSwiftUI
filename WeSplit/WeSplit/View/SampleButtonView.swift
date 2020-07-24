//
//  SampleButtonView.swift
//  WeSplit
//
//  Created by Lawrence on 7/24/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct SampleButtonView: View {
    
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count \(tapCount)") {
            self.tapCount += 1
        }
    }
}

struct SampleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SampleButtonView()
    }
}
