//
//  ContentView.swift
//  UnitConversion-Challenge
//
//  Created by Lawrence on 7/28/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var value = ""
    @State private var fromTemperatureUnit = 0
    @State private var toTemperatureUnit = 1
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedValue: String {
        let value = Double(self.value) ?? 0
        
        switch (fromTemperatureUnit, toTemperatureUnit) {
        case (0, 1):
            // Celsius to fahrenheit
            let x = Measurement(value: value, unit: UnitTemperature.celsius)
            return x.converted(to: .fahrenheit).description
        case (0, 2):
            // Celsius to kelvin
            let x = Measurement(value: value, unit: UnitTemperature.celsius)
            return x.converted(to: .kelvin).description
        case (1, 0):
            // Fahrenheit to Celsius
            let x = Measurement(value: value, unit: UnitTemperature.fahrenheit)
            return x.converted(to: .celsius).description
        case (1, 2):
            // Fahrenheit to kelvin
            let x = Measurement(value: value, unit: UnitTemperature.fahrenheit)
            return x.converted(to: .kelvin).description
        case (2, 0):
            // kelvin to Celsius
            let x = Measurement(value: value, unit: UnitTemperature.kelvin)
            return x.converted(to: .celsius).description
        case (2, 1):
            // kelvin to Fahrenheit
            let x = Measurement(value: value, unit: UnitTemperature.kelvin)
            return x.converted(to: .fahrenheit).description
        default:
            // return as is
            return String(value)
        }
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Value", text: $value)
            }
            
            Section(header: Text("From")) {
                Picker("Unit", selection: $fromTemperatureUnit) {
                    ForEach(temperatureUnits.indices) { index in
                        Text("\(self.temperatureUnits[index])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("To")) {
                Picker("Unit", selection: $toTemperatureUnit) {
                    ForEach(temperatureUnits.indices) { index in
                        Text("\(self.temperatureUnits[index])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Converted Value")) {
                Text("\(self.convertedValue)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
