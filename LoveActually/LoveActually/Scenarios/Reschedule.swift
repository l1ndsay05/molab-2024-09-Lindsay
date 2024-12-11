//
//  Reschedule.swift
//  LoveActually
//
//  Created by linds on 2024-11-30.
//

import SwiftUI

struct Reschedule: View {
    @EnvironmentObject var neuro: Neurotransmitter
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("Your first date went well! You and your partner planned a special night out, but you got caught up at work and couldn’t make it, leaving them disappointed.")
                    Image("reschedule")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                    NavigationLink(destination: Ghosted()){
                        Text("Apologize briefly but don’t make an effort to reschedule.")
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
                    
                    NavigationLink(destination: Anniversary()){
                        Text("You talk it out and plan a new date")
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
                    
                }
                .padding()
                
        }
    }
}

#Preview {
    Reschedule()
        .environmentObject(Neurotransmitter())
}
