//
//  ContentView.swift
//  week06
//
//  Created by linds on 2024-10-17.
//

import SwiftUI

//storing rgb as universal object?
class ColorModel: ObservableObject {
    @Published var redValue: Double = 0
    @Published var greenValue: Double = 0
    @Published var blueValue: Double = 0
    
    var rgbColor: Color{
        Color(
            red: Double(redValue) / 255.0,
            green: Double(greenValue) / 255.0,
            blue: Double(blueValue) / 255.0
        )
    }

}

struct ContentView: View {
    
    @StateObject var colorModel = ColorModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("View Picker"){
                    //image view
                    NavigationLink (destination: ImgView().environmentObject(colorModel)){
                        Text("Image View 🏙️")
                    }
                    
                    //animation view
                    NavigationLink (destination: AnimationView().environmentObject(colorModel)){
                        Text("Animation View 🎇")
                    }
                }
                 
                Section ("Color Picker"){
                    HStack {
                        Spacer()
                        Circle()
                            .fill(colorModel.rgbColor)
                            .frame(width: 200, height: 200)
                        Spacer()
                    }

                    VStack {
                        Slider(value: $colorModel.redValue, in: 0...255)
                            .frame(width:300)
                        Text("Red Value is \(colorModel.redValue, specifier: "%.1f")")
                        Slider(value: $colorModel.greenValue, in: 0...255)
                            .frame(width: 300)
                        Text("Green Value is \(colorModel.greenValue, specifier: "%.1f")")
                        Slider(value: $colorModel.blueValue, in: 0...255)
                            .frame(width: 300)
                        Text("Blue Value is \(colorModel.blueValue, specifier: "%.1f")")
                    }
                }
                .navigationTitle("views (work on title)")
            }
        
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(ColorModel())
}
