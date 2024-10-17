//
//  AnimationView.swift
//  week06
//
//  Created by linds on 2024-10-17.
//  Animation imported from Apple Developer Tools
// https://developer.apple.com/tutorials/sample-apps/animatingshapes?language=swift#Exploding-Animation

import SwiftUI
import SwiftUICore

struct AnimationView: View {
    @EnvironmentObject var colorModel: ColorModel
    @State private var isExploded = false
      
    var body: some View {
        Text("Animation View")

        VStack {
            Spacer()
            ZStack {
                ForEach(0..<500) { _ in
                    Rectangle()
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorModel.rgbColor)
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.2), value: isExploded)
                        .padding()
                }
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(colorModel.rgbColor)
                    .opacity(isExploded ? 0 : 1)
                    .animation(.easeInOut.speed(0.2), value: isExploded)
                    .padding()
            }
            Spacer()
                Button(action: playAnimation) {
                    Text("Play")
                        .padding()
                }
            
            .padding()
        }
        .navigationTitle("Explosion Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
    // Function to handle play action
    private func playAnimation() {
        isExploded = true
        // Automatically reset the animation after 2 seconds
        //from apple develope tools
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isExploded = false
        }
    }
}



           


