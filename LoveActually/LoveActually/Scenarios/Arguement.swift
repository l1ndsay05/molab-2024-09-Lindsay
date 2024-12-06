//
//  Arguement.swift
//  LoveActually
//
//  Created by linds on 2024-11-30.
//



import SwiftUI

struct Arguement: View {
    @EnvironmentObject var neuro: Neurotransmitter
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("You and your partner loved the anniversary plans. But you guys run into your first large issue and an argument ensues. How do you solve this?")
                    Image("argument")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                    NavigationLink(destination: Stress()){
                        Text("You apologize first, even if both are in the wrong")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.dopamine += 1
                            neuro.norepinephrine += 1
                        }
                    )
                    NavigationLink(destination: Results()){
                        Text("Wait for them to come to you first.")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.norepinephrine += 5
                        }
                    )
                    
                    NavigationLink(destination: Ignored()){
                        Text("Ignore that the argument ever happened.")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.serotonin -= 1
                            neuro.oxytocin -= 1
                        }
                    )
                    
                }
                .padding()
                
        }
    }
}

#Preview {
    Arguement()
        .environmentObject(Neurotransmitter())
}
