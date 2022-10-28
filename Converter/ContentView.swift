//
//  ContentView.swift
//  Converter
//
//  Created by Gideon Luck on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Farenheit"
    
    @FocusState private var amountIsFocused: Bool
    
    let units = ["Celsius", "Farenheit", "Kelvin"]
    
//    enum units {
//        case Celsius
//        case Farenheit
//        case Kelvin
//    }
//
    var convertedTemp: Double {
        var newTemp = 0.0
        
        
        if outputUnit == inputUnit {
            newTemp = inputValue
        } else if outputUnit == "Kelvin" && inputUnit == "Celsius" {
            
            newTemp = inputValue + 273.15
            
        } else if outputUnit == "Farenheit" && inputUnit == "Celsius" {
            
            newTemp =  inputValue * 1.8 + 32
            
        } else if outputUnit == "Farenheit" && inputUnit == "Kelvin" {
            
            newTemp = (inputValue - 273.15) * 1.8 + 32
            
        } else if outputUnit == "Celsius" && inputUnit == "Kelvin" {
            
            newTemp = inputValue - 273.15
            
        } else if outputUnit == "Celsius" && inputUnit == "Farenheit" {
            
            newTemp = (inputValue - 32) / 1.8
            
        } else if outputUnit == "Kelvin" && inputUnit == "Farenheit" {
            
            newTemp = ((inputValue - 32) / 1.8) + 273.15
            
        }
        
        return newTemp
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section("What would you like to convert from?") {
                    Picker("Input Length", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("What would you like to convert to?") {
                    Picker("Output length", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Input") {
                    TextField("Amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("Output") {
                    Text(convertedTemp, format: .number)
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
