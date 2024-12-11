//
//  SaveLoadJSON.swift
//  LoveActually
//
//  Created by linds on 2024-12-06.
//

import Foundation

func saveCredentials(username: String, password: String) {
    // Create the credentials object
    let credentials = UserCredentials(username: username, password: password)

    // Get the file URL for the JSON file
    guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("credentials.json") else {
        print("Could not locate file path.")
        return
    }

    do {
        // Convert the credentials struct to JSON data
        let jsonData = try JSONEncoder().encode(credentials)
        
        // Write the JSON data to the file
        try jsonData.write(to: fileURL, options: [.atomic, .completeFileProtection])
        print("Credentials saved successfully at \(fileURL).")
    } catch {
        print("Error saving credentials: \(error.localizedDescription)")
    }
}

func loadCredentials() -> UserCredentials? {
    guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("credentials.json") else {
        print("Could not locate file path.")
        return nil
    }

    do {
        // Step 1: Read the JSON data
        let jsonData = try Data(contentsOf: fileURL)
        
        // Step 2: Decode the JSON data into the struct
        let credentials = try JSONDecoder().decode(UserCredentials.self, from: jsonData)
        print("Credentials loaded successfully: \(credentials)")
        return credentials
    } catch {
        print("Error loading credentials: \(error.localizedDescription)")
        return nil
    }
}

