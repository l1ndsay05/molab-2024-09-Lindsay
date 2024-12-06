//
//  Ignored.swift
//  LoveActually
//
//  Created by linds on 2024-11-30.
//


import SwiftUI

struct Ignored: View {
    @EnvironmentObject var neuro: Neurotransmitter
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("Your Partner feels ignored. You are also overwhelmed and busy with life, so you aren't sure how to respond.")
                    Image("ignore")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                    NavigationLink(destination: Results()){
                        Text("You respond with brief messages since you're busy")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.serotonin -= 1
                        }
                    )
                    
                    NavigationLink(destination: Results()){
                        Text("You rarely respond, saying you'll respone later")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.oxytocin -= 1
                            neuro.dopamine -= 1
                        }
                    )
                    
                    NavigationLink(destination: Stress()){
                        Text("You talk it out")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.oxytocin += 1
                            neuro.serotonin += 1
                        }
                    )
                }
                .padding()
                
        }
    }
}

#Preview {
    Ignored()
        .environmentObject(Neurotransmitter())
}

