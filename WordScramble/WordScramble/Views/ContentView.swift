//
//  ContentView.swift
//  WordScramble
//
//  Created by Lawrence on 8/7/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords: [String] = []
    @State private var newWord = ""
    @State private var rootWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Your Word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(Text(rootWord))
            .onAppear(perform: startGame)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    func addNewWord() {
        let input = newWord.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard input.count > 0 else { return }
        
        guard isOriginal(word: input) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: input) else {
            wordError(title: "Word not recognized", message: "You can't just make up words!")
            return
        }
        
        guard isReal(word: input) else {
            wordError(title: "Word not possible", message: "That isn't a real word")
            return
        }
        
        // Add to used words
        usedWords.insert(input, at: 0)
        newWord = ""
    }
    
    func startGame() {
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsUrl) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from Bundle")
    }
    
    // This function basically checks if the word is used already
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    // This function checks if all letters from the input is present in the rootWord
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    // This function uses UITextChecker to check if it is a valid word.
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return mispelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
