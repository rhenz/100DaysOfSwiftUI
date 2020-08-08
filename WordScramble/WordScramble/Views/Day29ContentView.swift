//
//  Day29ContentView.swift
//  WordScramble
//
//  Created by Lawrence on 8/8/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct Day29ContentView: View {
    @State private var alertMessage = ""
    @State private var wordToCheck = ""
    @State private var showAlert = false
    
    let stringStuff = StringStuff()
    
    var body: some View {
        Form {
            TextField("", text: $wordToCheck, onCommit: checkIfValidWord)
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Hi"), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    func checkIfValidWord() {
        if stringStuff.checkMisspelledWord(word: wordToCheck) {
            self.alertMessage = "This is a valid word"
        } else {
            self.alertMessage = "This is not a valid word"
        }
        
        showAlert = true
    }
}

struct Day29ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Day29ContentView()
    }
}
