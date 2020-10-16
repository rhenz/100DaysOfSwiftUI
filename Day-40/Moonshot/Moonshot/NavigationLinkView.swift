//
//  NavigationLinkView.swift
//  Moonshot
//
//  Created by Lawrence on 8/20/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
       NavigationView {
          List(0..<100) { row in
             NavigationLink(destination: Text("Details")) {
                Text("Row \(row)")
             }
          }
          .navigationBarTitle("SwiftUI", displayMode: .inline)
       }
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView()
    }
}
