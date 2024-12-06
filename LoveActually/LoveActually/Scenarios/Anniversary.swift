

import SwiftUI

struct Anniversary: View {
    @EnvironmentObject var neuro: Neurotransmitter
    var body: some View {
            ZStack{
                Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
                VStack{
                    Text("It's your first anniverary together, and you want to do something memorable together.")
                    Image("anniversery")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                    NavigationLink(destination: Arguement()){
                        Text("Plan a weekend getaway to a place you both haven’t been to.")
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
                    
                    NavigationLink( destination: Arguement()){
                        Text("Prepare a home-cooked meal.")
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
                    NavigationLink(destination: Arguement()){
                        Text("Take a walk down memory lane, revisiting your first date.")
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
    Anniversary()
        .environmentObject(Neurotransmitter())
}
