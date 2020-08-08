//
//  TableViewLikeView.swift
//  WordScramble
//
//  Created by Lawrence on 8/7/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct TableViewLikeView: View {
    let myCats = ["Oli", "Nimbus", "Chabby"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Names")) {
                    ForEach(0..<myCats.count) {
                        Text(self.myCats[$0])
                    }
                }
            }
            
        .navigationBarTitle("My Cats")
        }
    }
}

struct TableViewLikeView_Previews: PreviewProvider {
    static var previews: some View {
        TableViewLikeView()
    }
}
