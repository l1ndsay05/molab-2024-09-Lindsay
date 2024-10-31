//
//  PageVideo.swift
//  week07&08
//
//  Created by linds on 2024-10-25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


struct PageVideo: View {
    @EnvironmentObject var colorModel: ColorModel
    @State private var squareOpacity: Double = 1.0
    
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
            
                WebView(url: URL(string: "https://www.youtube.com/embed/TjSeyvDree8")!)
                    .frame(height: 400)
               // Spacer()
                Rectangle()
                    .fill(colorModel.rgbColor)
                    .frame(width: 250, height: 250)
                    .opacity(squareOpacity)
                    .padding()
                
            }
            Spacer()
            // Slider to change opacity
            Slider(value: $squareOpacity, in: 0...1)
                .padding()
            
            Text("Opacity: \(Int(squareOpacity * 100))%")
                .font(.caption)
            Spacer()
            
        }
    }
}
struct PageVideo_Previews: PreviewProvider { // Updated to match PageVideo
    static var previews: some View {
        PageVideo()
            .environmentObject(ColorModel())
    }
}




