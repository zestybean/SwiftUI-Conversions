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
    
    let conversionOptions = ["Length", "Temp", "Area", "Volume", "Weight"]
    
    let conversionOptionLength = ["Meter", "Kilometer", "Centimeter", "Millimeter", "Micrometer", "Nanometer", "Mile", "Yard", "Foot", "Inch", "Light Year"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose a conversion option")) {
                    
                    Picker("Conversion Options", selection: $conversionChoice) {
                        ForEach(0..<conversionOptions.count) {
                            Text("\(self.conversionOptions[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Input your conversion number and type")) {
                    TextField("Input - Conversion", text: $inputConversionNumber)
                        .keyboardType(.decimalPad)
                    Picker("Sub Conversion Options", selection: $subConversionChoice) {
                        ForEach(0..<conversionOptionLength.count) {
                            Text("\(self.conversionOptionLength[$0])")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("Conversion Results")) {
                    ForEach(0..<conversionOptionLength.count) {
                        Text("\(self.conversionOptionLength[$0]): \(conversionResult)")
                    }
                }
                
                
            }
            .navigationTitle("Conversion Calculator")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
