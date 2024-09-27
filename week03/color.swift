//
//  ContentView.swift
//  week03
//
//  Created by linds on 2024-09-26.
//

import SwiftUI

struct color: View {
    @State private var redColor: Int = 0
    @State private var greenColor: Int = 0
    @State private var blueColor: Int = 0
    @FocusState private var isFocused: Bool
    
    var rgbColor: Color{
        Color(
            red: Double(redColor) / 255.0,
            green: Double(greenColor) / 255.0,
            blue: Double(blueColor) / 255.0
        )
    }
    

    
    var body: some View {
        NavigationStack{
            Form{
                Section ("Value for Red:"){
                    TextField("Red Value", value: $redColor, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                Section("Value for Green:"){
                    TextField("Green value", value: $greenColor, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                Section("Value for Blue:"){
                    TextField("Blue Value", value: $blueColor, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                Section("Circle"){
                    Circle()
                        .fill(rgbColor)
                    
                }
                
            }
            .navigationTitle("RGB Picker")
            .toolbar{
                if isFocused{
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
