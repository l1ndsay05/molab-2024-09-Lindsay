//
//  ImgView.swift
//  week06
//
//  Created by linds on 2024-10-17.
//

import SwiftUICore
import SwiftUI


struct ImgView: View {
    //accessing rgb
    @EnvironmentObject var colorModel: ColorModel
    @State private var currentImage: String = "img1"
    
    //to change between the images
    func changeImage() {
        if currentImage == "img1" {
            currentImage = "img2"
        }
        else if currentImage == "img2" {
            currentImage = "img3"
        } 
        else if currentImage == "img3" {
            currentImage = "img4"
        }
        else if currentImage == "img4" {
            currentImage = "img5"
        }
        else if currentImage == "img5" {
            currentImage = "img6"
        }
        else {
            currentImage = "img1"
        }
    }
    
    var body: some View {
        
        Text("Image View")
        
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
            VStack{
                ForEach(1...10, id: \.self){_ in
                    //how to make this for each vertical instead
                    HStack{
                        ForEach(1...8, id: \.self){_ in
                            Circle()
                                .fill(colorModel.rgbColor)
                                .frame(width: 30)
                                .padding(3)
                        }
                    }
                }
            }
        }
    }
}
