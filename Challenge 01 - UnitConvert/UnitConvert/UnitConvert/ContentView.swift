//
//  ContentView.swift
//  UnitConvert
//
//  Created by Endre Imecs on 5/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    var outputValue: Double {
        if inputUnit == "Second" {
            if outputUnit == "Second" {
                return inputValue
            } else if outputUnit == "Minute" {
                return inputValue / 60
            } else if outputUnit == "Hour" {
                return inputValue / 3600
            } else if outputUnit == "Day" {
                return inputValue / 86400
            }
            
        } else if inputUnit == "Minute" {
            if outputUnit == "Minute" {
                return inputValue
            } else if outputUnit == "Second" {
                return inputValue * 60
            } else if outputUnit == "Hour" {
                return inputValue / 60
            } else if outputUnit == "Day" {
                return inputValue / 1440
            }
            
        } else if inputUnit == "Hour" {
            if outputUnit == "Hour" {
                return inputValue
            } else if outputUnit == "Second" {
                return inputValue * 3600
            } else if outputUnit == "Minute" {
                return inputValue * 60
            } else if outputUnit == "Day" {
                return inputValue / 24
            }
            
        } else if inputUnit == "Day" {
            if outputUnit == "Day" {
                return inputValue
            } else if outputUnit == "Second" {
                return inputValue * 86400
            } else if outputUnit == "Minute" {
                return inputValue * 1440
            } else if outputUnit == "Hour" {
                return inputValue * 24
            }
        }
        
        return inputValue
    }
    
    var units = ["Second", "Minute", "Hour", "Day"]
    
    var body: some View {
        Form {
            Section {
                TextField("Input Value", value: $inputValue, format: .number)
            }
            
            Section("Input Unit") {
                Picker("Input Unit", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Output Unit") {
                Picker("Output Unit", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section {
                Text("\(outputValue.formatted())")
            }
            
            Section {
                Button {
                    print(outputValue)
                } label: {
                    Text("Push")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
