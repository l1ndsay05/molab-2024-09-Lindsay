//
//  Stress.swift
//  LoveActually
//
//  Created by linds on 2024-11-30.
//

import SwiftUI

struct Stress: View {
    @EnvironmentObject var neuro: Neurotransmitter
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("You guys talk it through and decide to handle the stress together through...")
                    Image("stress")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                    NavigationLink(destination: Results()){
                        Text("You offer to listen.")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.oxytocin += 1
                        }
                    )
                    NavigationLink(destination: Results()){
                        Text("Suggest a fun distraction.")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.dopamine += 1
                            neuro.serotonin += 1
                        }
                    )
                }
                .padding()
                
        }
    }
}

#Preview {
    Stress()
        .environmentObject(Neurotransmitter())
}
