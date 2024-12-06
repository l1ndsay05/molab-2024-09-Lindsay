//
//  Login.swift
//  LoveActually
//
//  Created by linds on 2024-11-22.
//

import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.82, blue: 0.86).ignoresSafeArea()
            VStack {
                ZStack{
                    Circle()
                        .fill(Color(red: 0.92, green: 0.57, blue: 0.7))
                        .frame(width: 200, height:200)
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 150))
                        .foregroundStyle(Color(red: 0.68, green: 0.12, blue: 0.33))
                }
                TextField(
                    "Username",
                    text: $username
                )
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                
                TextField(
                    "Password",
                    text: $password
                )
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
               
                NavigationLink("Enter", destination: FirstDate())
                    .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                    .padding()
                    .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                    .cornerRadius(30)

            }
            .padding()
        }
    }
}

#Preview {
    Login()
}
