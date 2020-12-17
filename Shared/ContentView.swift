//
//  ContentView.swift
//  Shared
//
//  Created by Brando Lugo on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputConversionNumber = ""
    @State private var inputConversionChoice = 0

    let inputConversionOptions = ["Celsius", "Kelvin", "Fahrenheit"]
    
    @State private var outputConversionChoice = 0
    
    let outputConversionOptions = ["Celsius", "Kelvin", "Fahrenheit"]
    
    var conversionResults: Double {
        let inputTemp = Double(inputConversionNumber) ?? 0
        
        if(inputConversionChoice == 0 && outputConversionChoice == 0) {
            //Celsius to Celsius
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.celsius)
            return temp.converted(to: UnitTemperature.celsius).value
        } else if(inputConversionChoice == 0 && outputConversionChoice == 1) {
            //Celsius to Kelvin
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.celsius)
            return temp.converted(to: UnitTemperature.kelvin).value
        } else if(inputConversionChoice == 0 && outputConversionChoice == 2) {
            //Celsius to Fahrenheit
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.celsius)
            return temp.converted(to: UnitTemperature.fahrenheit).value
        }
        
        if(inputConversionChoice == 1 && outputConversionChoice == 0) {
            //Celsius to Celsius
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.kelvin)
            return temp.converted(to: UnitTemperature.celsius).value
        } else if(inputConversionChoice == 1 && outputConversionChoice == 1) {
            //Celsius to Kelvin
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.kelvin)
            return temp.converted(to: UnitTemperature.kelvin).value
        } else if(inputConversionChoice == 1 && outputConversionChoice == 2) {
            //Celsius to Fahrenheit
            let celTemp = Measurement.init(value: inputTemp, unit: UnitTemperature.kelvin)
            return celTemp.converted(to: UnitTemperature.fahrenheit).value
        }
        
        if(inputConversionChoice == 2 && outputConversionChoice == 0) {
            //Celsius to Celsius
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.fahrenheit)
            return temp.converted(to: UnitTemperature.celsius).value
        } else if(inputConversionChoice == 2 && outputConversionChoice == 1) {
            //Celsius to Kelvin
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.fahrenheit)
            return temp.converted(to: UnitTemperature.kelvin).value
        } else if(inputConversionChoice == 2 && outputConversionChoice == 2) {
            //Celsius to Fahrenheit
            let temp = Measurement.init(value: inputTemp, unit: UnitTemperature.fahrenheit)
            return temp.converted(to: UnitTemperature.fahrenheit).value
        }
        
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose your intput temp type")) {
                    
                    Picker("Conversion Options", selection: $inputConversionChoice) {
                        ForEach(0..<inputConversionOptions.count) { choice in
                            Text("\(self.inputConversionOptions[choice])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Input - Conversion", text: $inputConversionNumber)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Conversion Results")) {
                    Picker("Conversion Options", selection: $outputConversionChoice) {
                        ForEach(0..<outputConversionOptions.count) { choice in
                            Text("\(self.outputConversionOptions[choice])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Result: \(conversionResults, specifier: "%.1f")")
                 
                }
                
                
            }
            .navigationTitle("Temp Converter")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
