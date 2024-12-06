//
//  LoveActuallyApp.swift
//  LoveActually
//
//  Created by linds on 2024-11-22.
//

import SwiftUI

@main
struct LoveActuallyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Neurotransmitter())
        }
    }
}
