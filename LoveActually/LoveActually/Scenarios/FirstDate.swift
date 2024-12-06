//
//  FirstDate.swift
//  LoveActually
//
//  Created by linds on 2024-11-22.
//

import SwiftUI

struct FirstDate: View {
    @EnvironmentObject var neuro: Neurotransmitter
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("You're meeting someone new, and you both feel that nervous excitement.")
                    Image("love1")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                    NavigationLink(destination: Reschedule()){
                        Text("Ask them open-ended questions about their interests and actively listen.")
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
                    NavigationLink(destination: Ghosted()){
                        Text("Try to impress them by talking about your accomplishments.")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.oxytocin -= 1
                        }
                    )
                    NavigationLink(destination: Reschedule()){
                        Text("Engage in light flirting and compliment them")
                            .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                            .padding()
                            .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                            .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded{
                            neuro.norepinephrine += 1
                        }
                    )
                        
                }
                .padding()
        }
    }
}

#Preview {
    FirstDate()
        .environmentObject(Neurotransmitter())
}
