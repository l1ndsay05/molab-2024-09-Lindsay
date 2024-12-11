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
    @State private var navigateToResults = false
    @State private var navigateToScene = false
    
    var body: some View {
        NavigationView{
            
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
                    
                    SecureField(
                        "Password",
                        text: $password
                    )
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    
                    Button("Enter"){
                        if credentialsExist(inputUsername: username, inputPassword: password) {
                            navigateToResults = true // Navigate to Results if credentials match
                        } else {
                            navigateToScene = true // Navigate to FirstDate if no match
                        }
                    }
                    .colorMultiply(Color(red: 0.18, green: 0.08, blue: 0.06))
                    .padding()
                    .background(Color(red: 0.92, green: 0.57, blue: 0.7))
                    .cornerRadius(30)
                    
                    .navigationDestination(isPresented: $navigateToResults){
                        Results()
                    }
                    .navigationDestination(isPresented: $navigateToScene){
                        FirstDate()
                    }
                    NavigationLink("Scene", destination: FirstDate())
                    
                }
                .padding()
                
            }
        }
    }
}
func credentialsExist(inputUsername: String, inputPassword: String) -> Bool {
    guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("credentials.json") else {
        print("Could not locate file path.")
        return false
    }
    
    do {
        let jsonData = try Data(contentsOf: fileURL)
        let storedCredentials = try JSONDecoder().decode(UserCredentials.self, from: jsonData)
        
        // Compare stored credentials with input
        return storedCredentials.username == inputUsername && storedCredentials.password == inputPassword
    } catch {
        print("Error reading or decoding credentials: \(error.localizedDescription)")
        return false
    }
}

#Preview {
    Login()
}
