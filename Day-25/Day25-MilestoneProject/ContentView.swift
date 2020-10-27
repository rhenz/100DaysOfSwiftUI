//
//  ContentView.swift
//  Day25-MilestoneProject
//
//  Created by Lawrence on 8/2/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldWin = Bool.random()
    @State private var appSelectedIndex = Int.random(in: 0...2)
    @State private var currentRound = 1
    @State private var score = 0
    @State private var shouldShowAlert = false
    
    private let maxRound = 10
    private let jankenSigns = [Sign.rock, Sign.paper, Sign.scissors]
    
    private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [.yellow, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // Content
            VStack(spacing: 100) {
                VStack(spacing: 20) {
                    TitleText(currentRound: currentRound)
                    ScoreText(score: score)
                }
                
                // App
                VStack(spacing: 20) {
                    Text(jankenSigns[self.appSelectedIndex].emoji)
                        .jankenStyle()
                    HStack {
                        Text("You should")
                            .font(.system(size: 30))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Text("\(shouldWin ? "WIN": "LOSE" )")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(shouldWin ? .green : .red)
                    }
                }
                
                // Answer
                HStack(alignment: .center) {
                    ForEach(0..<self.jankenSigns.count) { index in
                        Button(action: {
                            self.checkAnswer(userSelectedIndex: index)
                        }, label: {
                            Text(self.jankenSigns[index].emoji)
                                .jankenStyle()
                                .frame(maxWidth: .infinity)
                        })
                    }
                }
                
                // Spacer
                Spacer()
            }
        }.alert(isPresented: $shouldShowAlert) {
            self.setAlert(title: "Game Finished", message: "Your score is \(score) out of \(maxRound)!")
        }
    }
    
    // MARK: - Helper Methods
    private func setAlert(title: String, message: String) -> Alert {
        return Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("Ok"), action: {
            self.restartGame()
        }))
    }
    
    private func checkAnswer(userSelectedIndex: Int) {
        let appChoice = jankenSigns[appSelectedIndex]
        let yourChoice = jankenSigns[userSelectedIndex]
        let result = appChoice.checkResult(userSelection: yourChoice)
        
        switch result {
        case .win:
            if shouldWin { self.score += 1 }
        case .lose:
            if !shouldWin { self.score += 1 }
        case .draw: break
        }
        
        // Change app selection
        self.newChallenge()
        
        // Check if last round
        if self.currentRound == self.maxRound {
            self.shouldShowAlert = true
        } else {
            // Increment Round
            self.currentRound += 1
        }
    }
    
    private func restartGame() {
        self.score = 0
        self.currentRound = 1
        self.newChallenge()
    }
    
    private func newChallenge() {
        self.appSelectedIndex = Int.random(in: 0...2)
        self.shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleText: View {
    var currentRound: Int
    
    var body: some View {
        Text("Round \(currentRound) of 10")
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text("Score: \(score)")
    }
}

struct Janken: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 100))
    }
}

extension View {
    func jankenStyle() -> some View {
        self.modifier(Janken())
    }
}
