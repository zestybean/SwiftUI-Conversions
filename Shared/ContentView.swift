//
//  ContentView.swift
//  Shared
//
//  Created by Brando Lugo on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputConversionNumber = ""
    @State private var conversionChoice = 0
    
    @State private var subConversionChoice = 0
    
    var conversionResult = 0.0
    
    let conversionOptions = ["Celsius", "Kelvin", "Fahrenheit", "Volume", "Weight"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose a conversion option")) {
                    
                    Picker("Conversion Options", selection: $conversionChoice) {
                        ForEach(0..<conversionOptions.count) { choice in
                            Text("\(self.conversionOptions[choice])")
                        }
                    }
                    .onChange(of: conversionChoice) {_ in
                        print(conversionChoice)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Input your conversion number and type")) {
                    TextField("Input - Conversion", text: $inputConversionNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Conversion Results")) {
                 
                        Text("\(conversionResult)")
                 
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
