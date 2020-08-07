//
//  ContentView.swift
//  BetterRest
//
//  Created by Lawrence on 8/3/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static private var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var calculateBedtime: String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hourSec = (components.hour ?? 0) * 60 * 60
        let minuteSec = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hourSec + minuteSec), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            return formatter.string(from: sleepTime)
        } catch {
            print("Error: \(error.localizedDescription)")
            return error.localizedDescription
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: CustomSectionText(title: "When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection:  $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: CustomSectionText(title: "Desired amount of sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours").padding()
                    }
                }
                
                Section(header: CustomSectionText(title: "Daily coffee intake")) {
                    Stepper(value: $coffeeAmount, in: 1...12, step: 1) {
                        Text("\(coffeeAmount) \(coffeeAmount > 1 ? "cups" : "cup")")
                    }
                }
                
                Section(header: CustomSectionText(title: "Result:")) {
                    Text("Your ideal bedtime is... \(calculateBedtime)")
                        .font(.headline)
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
}

struct CalculateButton: View {
    var action: (() -> Void)
    var body: some View {
        Button(action: action) {
            Text("Calculate")
        }
    }
}

struct CustomSectionText: View {
    var title: String
    var body: some View {
        Text(title)
            .fontWeight(.bold)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
