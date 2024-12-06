//
//  Results.swift
//  LoveActually
//
//  Created by linds on 2024-11-30.
//

import SwiftUI

struct Results: View {
    @EnvironmentObject var neuro: Neurotransmitter
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("Results!")
                    Text("Oxytocin Levels: \(neuro.oxytocin)")
                    Text("Serotonin Levels: \(neuro.serotonin)")
                    Text("Norepinephrine Levels: \(neuro.norepinephrine)")
                    Text("Dopamine Levels: \(neuro.dopamine)")


                    
                }
                .padding()
                
        }
    }
}

#Preview {
    Results()
        .environmentObject(Neurotransmitter())
}
