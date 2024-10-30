//
//  ContentView.swift
//  week07&08
//
//  Created by linds on 2024-10-25.
//

import SwiftUI

//storing rgb as universal object?
class ColorModel: ObservableObject {
    @AppStorage("redColour") var redValue: Double = 0
    @AppStorage("greenColour") var greenValue: Double = 0
    @AppStorage("blueColor") var blueValue: Double = 0
    
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
//    @EnvironmentObject var pageModel: PageModel
    
    
    var body: some View {
        VStack {
            NavigationStack{
                Spacer()
                VStack{
                    Circle()
                        .fill(colorModel.rgbColor)
                        .frame(width: 300, height: 300)
                        .padding(20)
                    //red slider
                    Slider(value: $colorModel.redValue, in: 0...255).frame(width:255)
                    Text("Red Value is \(colorModel.redValue, specifier: "%.1f")")
                    //green slider
                    Slider(value: $colorModel.greenValue, in: 0...255).frame(width:255)
                    Text("Green Value is \(colorModel.greenValue, specifier: "%.1f")")
                    //blue slider
                    Slider(value: $colorModel.blueValue, in: 0...255)
                        .frame(width: 255)
                    Text("Blue Value is \(colorModel.blueValue, specifier: "%.1f")")
                }
                Spacer()
                HStack {
//                    NavigationLink(destination: PageAddImg()) {
//                        Label("", systemImage: "square.and.arrow.up")
//                    }
                    NavigationLink(destination: PageAddImg()) {
                        Label("", systemImage: "photo.fill")
                    }
                    NavigationLink(destination: PageVideo()) {
                        Label("", systemImage: "video.circle.fill")
                    }
                    
                }.navigationTitle("Color Image")
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(ColorModel())
//        .environmentObject(PageModel())
}

