////
////  PageAddImgCopy.swift
////  week07&08
////
////  Created by linds on 2024-10-25.
////
//
////
////  PageAddImg.swift
////  week07&08
////
////  Created by linds on 2024-10-25.
////
////using json to add images + names for images?
//
//import SwiftUI
//import PhotosUI
//import UIKit
//
////image data
//struct ImageAdding: Identifiable, Decodable{
//    var id: String
//    var name: String
//    var uiImage: UIImage?
//}
//
//struct PageAddImg: View {
//    //variables for user input
//    @State private var images: [ImageAdding] = load("imagesData.json")
//    
//    
//    
//    
//    var body: some View {
//        VStack {
//            Text("Import Image")
//            ForEach(images) { image in
//                VStack {
//                    if let uiImage = UIImage(named: image.name) {
//                        Image(uiImage: uiImage)
//                            .resizable()
//                            .frame(width: 100, height: 100)
//                    } else {
//                        Text("Image \(image.name) not found")
//                            .foregroundColor(.red)
//                    }
//                    Text("\(image.name) is here")
//                }
//            }
//        }
//    }
//}
//
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
//
//struct PageAddImg_Previews: PreviewProvider {
//    static var previews: some View {
//        PageAddImg()
//    }
//}
//
//
