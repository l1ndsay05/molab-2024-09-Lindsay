//
//  Ghosted.swift
//  LoveActually
//
//  Created by linds on 2024-11-22.
//

import SwiftUI

struct Ghosted: View {
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("You got ghosted!")
                    Image("ghosted")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                    NavigationLink(destination: Results()){
                        Text("Check you results")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    
                }
                .padding()
                
        }
    }
}

#Preview {
    Ghosted()
}
