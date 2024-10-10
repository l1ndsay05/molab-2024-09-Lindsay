//
//  ContentView.swift
//  week05
//
//  Created by linds on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue: Double = 0
    @State private var greenValue: Double = 0
    @State private var blueValue: Double = 0

    @State private var currentImage: String = "landscape"
    
    var rgbColor: Color{
        Color(
            red: Double(redValue) / 255.0,
            green: Double(greenValue) / 255.0,
            blue: Double(blueValue) / 255.0
        )
    }
    
    //to change between the 3 images
    func changeImage() {
        if currentImage == "landscape" {
            currentImage = "bridgeFar"
        } else if currentImage == "bridgeFar" {
            currentImage = "bridgeClose"
        } else {
            currentImage = "landscape"
        }
    }
    
    var body: some View {
        Button(action: {
            changeImage()
        }) {
            Label("Change Image", systemImage: "photo")
        }
        .padding()
        
        ZStack{
            
            Image(currentImage)
                .resizable()
                .scaledToFit()
            //.frame(width: 200, height: 200)
                .padding()
            Circle()
                .fill(rgbColor)
                .frame(width: 120)
        }
    
        VStack {
            Slider(value: $redValue, in: 0...255)
                .frame(width:300)
            Text("Red Value is \(redValue, specifier: "%.1f")")
            Slider(value: $greenValue, in: 0...255)
                .frame(width: 300)
            Text("Green Value is \(greenValue, specifier: "%.1f")")
            Slider(value: $blueValue, in: 0...255)
                .frame(width: 300)
            Text("Blue Value is \(blueValue, specifier: "%.1f")")
        }

    }
}

#Preview {
    ContentView()
}
