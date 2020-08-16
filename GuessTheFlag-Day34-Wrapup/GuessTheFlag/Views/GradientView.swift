//
//  GradientView.swift
//  GuessTheFlag
//
//  Created by Lawrence on 7/28/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        //        LinearGradient(gradient: Gradient(colors: [.white, .black
        //        ]), startPoint: .top, endPoint: .bottom)
        
        //        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        AngularGradient(gradient: Gradient(colors: [.red, .green, .blue, .purple, .gray, .orange, .pink]), center: .center)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
