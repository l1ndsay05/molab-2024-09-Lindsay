//
//  PageAddImg.swift
//  week07&08
//
//  Created by linds on 2024-10-25.
//
//using json to add images + names for images?

import SwiftUI
import PhotosUI

import SwiftUI
import PhotosUI

struct PageAddImg: View {
    @EnvironmentObject var colorModel: ColorModel

    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var imageName: String = ""

    var body: some View {
        VStack {
            
            PhotosPicker("Select Photo", selection: $avatarItem, matching: .images)
                .padding()
            
            ZStack{
                if let avatarImage = avatarImage {
                    avatarImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                } else {
                    Text("No image selected")
                        .foregroundColor(.gray)
                        .frame(width: 300, height: 300)
                        .border(Color.gray, width: 1)
                }
                VStack{
                    //make it filled up looking or by the image size?
                    ForEach(1...4, id: \.self){_ in
                        //how to make this for each vertical instead
                        HStack{
                            ForEach(1...6, id: \.self){_ in
                                Circle()
                                    .fill(colorModel.rgbColor)
                                    .frame(width: 30)
                                    .padding(3)
                            }
                        }
                    }
                }
            }
            
            //
        }
        .frame(width: 400, height: 500, alignment: .center)
        .onChange(of: avatarItem){
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    avatarImage = Image(uiImage: uiImage)
                } else {
                    print("Failed to load image")
                }
            }
        }
    }
}

struct PageAddImg_Previews: PreviewProvider {
    static var previews: some View {
        PageAddImg()
            .environmentObject(ColorModel())
    }
}


