//
//  ContentView.swift
//  LoveActually
//
//  Created by linds on 2024-11-22.
//

import SwiftUI

class Neurotransmitter: ObservableObject {
    @Published var dopamine: Int = 0
    @Published var norepinephrine: Int = 0
    @Published var serotonin: Int = 0
    @Published var oxytocin: Int = 0
}

struct ContentView: View {
    //@StateObject var neuro = Neurotransmitter()
//    @State var dopamine: Int = 0
//    @State var oxytocin: Int = 0
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("The Love Circuit")
                        .bold()
                        .font(.largeTitle)
                    Text("Welcome, see love through the lens of neuroscience")
                    NavigationLink("Log In / Sign Up", destination: Login())
                        .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                        .padding()
                        .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                        .cornerRadius(30)
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Neurotransmitter())
}
